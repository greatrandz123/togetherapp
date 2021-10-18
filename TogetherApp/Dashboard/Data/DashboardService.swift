//
//  DashboardService.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import Foundation
import RxSwift
import HealthKit

struct DayStep {
    let id: Int
    let day: String
    let steps: Int
    
    init(id: Int, day: String, steps: Int) {
        self.id = id
        self.day = day
        self.steps = steps
    }
}

final class DashboardService {
    typealias T = LaunchCoordinator.scene
    private let healthStore = HKHealthStore()
    
    func loadCurrentWeekSteps() -> Observable<[DayStep]> {
        let observer = Observable<[DayStep]>
            .create { (observer) -> Disposable in
            
            self.getCurrentWeekSteps(observer: observer)
            return Disposables.create()
        }
        return observer
    }
    
    private func convertDateToLocalTime(_ date: Date) -> Date {
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: date))
        return Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: date)!
    }
    
    private func getCurrentWeekSteps(observer: AnyObserver<[DayStep]>) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let now = convertDateToLocalTime(Date())
        let startWeek = convertDateToLocalTime(now.startOfWeek!)
        let endWeek = convertDateToLocalTime(now.endOfWeek!)
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startWeek,
            end: endWeek,
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: stepsQuantityType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, _ in
            
            print("getCurrentWeekSteps: ", result ?? [])
            
//            guard let result = result, let sum = result.sumQuantity() else {
//                observer.onNext(0.0)
//                observer.onCompleted()
//                return
//            }
            
            let array: [DayStep] =  [DayStep(id: 0, day:  "Su", steps: 413),
                                     DayStep(id: 1, day:  "Mo", steps: 0),
                                     DayStep(id: 2, day:  "Tu", steps: 756),
                                     DayStep(id: 3, day:  "We", steps: 2345),
                                     DayStep(id: 4, day:  "Th", steps: 1435),
                                     DayStep(id: 5, day:  "Fr", steps: 3535),
                                     DayStep(id: 6, day:  "Sa", steps: 2341)]
//
            observer.onNext(array)
            observer.onCompleted()
        }
        healthStore.execute(query)
    }
    
}
