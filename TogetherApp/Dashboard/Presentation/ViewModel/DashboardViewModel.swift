//
//  DashboardViewModel.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit
import RxSwift

final class DashboardViewModel: TableViewSection {
    
    private let disposeBag = DisposeBag()
    private let coordinator: DashboardCoordinator
    private let service: DashboardService
    
    private var tableViewManager = TableViewManager()
    var items = [TableViewItem]()
    var height: CGFloat = 12
    
    init(coordinator: DashboardCoordinator, service: DashboardService) {
        self.coordinator = coordinator
        self.service = service
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
        self.items = [DashboardItem(id: 0, title:  "Su", description: "413"),
                      DashboardItem(id: 1, title:  "Mo", description: "0"),
                      DashboardItem(id: 2, title:  "Tu", description: "756"),
                      DashboardItem(id: 3, title:  "We", description: "2345"),
                      DashboardItem(id: 4, title:  "Th", description: "1435"),
                      DashboardItem(id: 5, title:  "Fr", description: "3535"),
                      DashboardItem(id: 6, title:  "Sa", description: "2341")]
        
        service.loadTodaysSteps()
            .subscribe(onNext: { (todaysSteps) in
                
                print("todaysSteps: \(todaysSteps)")
                
            }, onError: { (_) in },
               onCompleted: { }
        ).disposed(by: disposeBag)
    }
    
    func loadTodaysItems() {
        
    }
    
    func headerView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
}
