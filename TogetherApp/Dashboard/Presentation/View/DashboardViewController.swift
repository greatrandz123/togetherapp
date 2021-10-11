//
//  DashboardViewController.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit
import HealthKit

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
        viewModel.configure(tableView: tableView)
    }
    
    let healthStore = HKHealthStore()

    func getTodaysSteps(completion: @escaping (Double) -> Void) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: now,
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: stepsQuantityType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        
        healthStore.execute(query)
    }
    
}
