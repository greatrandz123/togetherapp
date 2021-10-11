//
//  DashboardService.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import Foundation
import RxSwift
import HealthKit

final class DashboardService {
    typealias T = LaunchCoordinator.scene
    private let healthStore = HKHealthStore()
    
    func loadTodaysSteps() -> Observable<Double> {
        let observer = Observable<Double>
            .create { (observer) -> Disposable in
            
            self.getTodaysSteps(observer: observer)
            return Disposables.create()
        }
        return observer
    }
    
    private func getTodaysSteps(observer: AnyObserver<Double>) {
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
                observer.onNext(0.0)
                observer.onCompleted()
                return
            }
            
            observer.onNext(sum.doubleValue(for: HKUnit.count()))
            observer.onCompleted()
        }
        healthStore.execute(query)
    }
    
}
