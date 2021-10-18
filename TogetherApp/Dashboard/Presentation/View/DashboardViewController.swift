//
//  DashboardViewController.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

final class DashboardViewController: UIViewController {

    private let viewModel: DashboardViewModel
    @IBOutlet private var tableView: UITableView!
    
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: DashboardViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 10, vertical: 210), for: UIBarMetrics.default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewModel.configure(tableView: tableView)
    }
    
}
