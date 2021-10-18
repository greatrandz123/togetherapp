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
    private let service: DashboardService
    private let coordinator: DashboardCoordinator
    private let tableViewManager = TableViewManager()
    
    internal var height: CGFloat = 12
    internal var items = [TableViewItem]()
    
    init(coordinator: DashboardCoordinator, service: DashboardService) {
        self.coordinator = coordinator
        self.service = service
        loadCurrentWeekSteps()
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
        tableView.backgroundColor = .white
        tableView.register(DashboardTableViewCell.nib, forCellReuseIdentifier: DashboardTableViewCell.identifier)
    }
    
    func loadCurrentWeekSteps() {
        
        service.loadCurrentWeekSteps()
            .subscribe(onNext: { (steps: [DayStep]) in
                
                self.items = steps.map({ DashboardItem(id: $0.id, title: $0.day, description: "\($0.steps)")})
                
            }, onError: { (_) in },
               onCompleted: { }
        ).disposed(by: disposeBag)
        
    }
    
    func headerView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
}
