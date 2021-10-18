//
//  Date+Extension.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/17/21.
//

import UIKit

extension Date {
    
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: startDay)
    }

    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
            guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
       return gregorian.date(byAdding: .day, value: 7, to: startDay)
   }
    
}
