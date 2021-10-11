//
//  TableViewManager.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class TableViewManager: NSObject {
    private weak var tableView: UITableView?
    
    private(set) var sections = [TableViewSection]()
    
    func configure(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
        self.tableView?.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    func update(sections: [TableViewSection]) {
        self.sections = sections
        reloadData()
    }
    
    func allowsMultipleSelection(_ allow: Bool) {
        self.tableView?.allowsMultipleSelection = allow
    }

    func insertItems(items: [TableViewItem], at indexPath: IndexPath, completion: TableViewItemCompletion?) {
        
        UIView.setAnimationsEnabled(true)
        
        let start = NSDate()
        let indexPaths = items.enumerated().map { (index, item) -> IndexPath in
            
            let indexRow = indexPath.row + (index + 1)
            self.sections[indexPath.section].items.insert(item, at: indexRow)
            return IndexPath(row: indexRow, section: indexPath.section)
        }
        
        let rowAnimation:UITableView.RowAnimation = (items.count==1) ? .top : .bottom
        self.tableView?.insertRows(at: indexPaths, with: rowAnimation)
        
        let timeSinceNow = start.timeIntervalSinceNow
        let animatedTime = (Double("\(0 - timeSinceNow)")!  + 0.3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animatedTime) {
            completion?()
        }
        
    }
    
    func removeItems(items: [TableViewItem], animated: Bool, completion: TableViewItemCompletion?) {
        
        UIView.setAnimationsEnabled(animated)
        
        let start = NSDate()
        let indexPaths = items.map { self.getIndexPath(id: $0.id) }
        
        if !indexPaths.isEmpty {
            self.sections[indexPaths.first!.section].items
                .removeSubrange(indexPaths.first!.row ..< indexPaths.last!.row + 1)
            self.tableView?.deleteRows(at: indexPaths, with: .top)
        }
        
        let timeSinceNow = start.timeIntervalSinceNow
        let animatedTime = (Double("\(0 - timeSinceNow)")!  + 0.3)
        let deadline = animated ? animatedTime : 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + deadline) {
            UIView.setAnimationsEnabled(true)
            completion?()
        }
            
    }
    
    func getIndexPath(id: Int) -> IndexPath {
        var _indexPath: IndexPath?
        for (indexPathSection, section) in sections.enumerated() {
            //let items = self.sections.flatMap({ $0.items })
            if let indexPathRow = section.items.firstIndex(where: { $0.id == id })  {
                _indexPath = IndexPath(row: indexPathRow, section: indexPathSection)
            }
        }
        guard let indexPath = _indexPath else {
            fatalError()
        }
        return indexPath
    }
    
    func reloadRows(at: [IndexPath]) {
        DispatchQueue.main.async {
            self.tableView?.reloadRows(at: at, with: .none)
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
}

extension TableViewManager: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].items[indexPath.row].cell(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].items[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].items[indexPath.row].cell(tableView, didSelectRowAt: indexPath)
    }

}

extension TableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].headerView(tableView, viewForHeaderInSection: section)
    }
    
    
}
