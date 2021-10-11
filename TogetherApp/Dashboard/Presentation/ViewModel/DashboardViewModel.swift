//
//  DashboardViewModel.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

final class DashboardViewModel: TableViewSection {
    
    
    let coordinator: DashboardCoordinator
    private var tableViewManager = TableViewManager()
    var items = [TableViewItem]()
    var height: CGFloat = 12
    
    init(coordinator: DashboardCoordinator) {
        self.coordinator = coordinator
        configureItems()
    }
    
    var sections: [TableViewSection] {
        return [self]
    }
    
    func configure(tableView: UITableView) {
        registerCells(for: tableView)
        tableViewManager.configure(tableView: tableView)
        tableViewManager.update(sections: sections)
    }
    
    func registerCells(for tableView: UITableView) {
        tableView.register(DashboardTableViewCell.nib, forCellReuseIdentifier: DashboardTableViewCell.identifier)
    }
    
    func configureItems() {
        var item = DashboardItem(id: 1, title:  "Su", description: "413")
        items.append(item)
        item = DashboardItem(id: 1, title:  "Mo", description: "0")
        items.append(item)
        item = DashboardItem(id: 1, title:  "Tu", description: "756")
        items.append(item)
        item = DashboardItem(id: 1, title:  "We", description: "2345")
        items.append(item)
        item = DashboardItem(id: 1, title:  "Th", description: "1435")
        items.append(item)
        item = DashboardItem(id: 1, title:  "Fr", description: "3535")
        items.append(item)
        item = DashboardItem(id: 1, title:  "Sa", description: "2341")
        items.append(item)
    }
    
    func headerView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
}
