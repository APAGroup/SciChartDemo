//
//  DateHelper.swift
//  SciChartDemo
//
//  Created by Admin on 18/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import SciChart


extension TimeInterval {
    private struct TimeIntervalConstants {
        static let SecondsInMinute = 60
        static let MinutesInHour = 60
        static let HoursInDay = 24
    }
    
    static func fromSeconds (_ seconds: Int) -> TimeInterval {
        return TimeInterval(seconds)
    }
    
    static func fromMinutes (_ minutes: Int) -> TimeInterval {
        return TimeInterval (minutes * TimeIntervalConstants.SecondsInMinute)
    }
    
    static func fromHours (_ hours: Int) -> TimeInterval {
        return TimeInterval (hours * TimeIntervalConstants.MinutesInHour * TimeIntervalConstants.SecondsInMinute)
    }
    
    static func fromDays (_ days: Int) -> TimeInterval {
        return TimeInterval (days * TimeIntervalConstants.HoursInDay * TimeIntervalConstants.MinutesInHour * TimeIntervalConstants.SecondsInMinute)
    }
    
    static func fromDays (_ days: Double) -> TimeInterval {
        return TimeInterval (days * Double(TimeIntervalConstants.HoursInDay) * Double(TimeIntervalConstants.MinutesInHour) * Double(TimeIntervalConstants.SecondsInMinute))
    }
}

extension Date {
    var startOfDay : Date? {
        get {
            let calendar = Foundation.Calendar.current
            var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
            components.nanosecond = 0
            components.hour = 0
            components.minute = 0
            components.second = 0
            
            return calendar.date(from: components)
        }
    }
}



class DateHelper {
  static func range () -> SCIDateRange {
      if  let baseDate = Date().startOfDay {
            let start = baseDate.addingTimeInterval(TimeInterval.fromMinutes(30))
                let end = start.addingTimeInterval(TimeInterval.fromDays(1)).addingTimeInterval(TimeInterval.fromSeconds(-1))
                
                return SCIDateRange(dateMin: start, max: end)
        }
    
        return SCIDateRange(dateMin: Date(), max: Date())
    }
}
