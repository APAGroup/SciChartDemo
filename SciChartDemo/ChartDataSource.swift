//
//  ChartDataSource.swift
//  SciChartDemo
//
//  Created by Admin on 04/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit
import SciChart

protocol DataPointProtocol {
    var timestamp : Date { get }
    var data : Int { get }
}

struct DataPoint : DataPointProtocol {
    let timestamp : Date
    let data : Int
}

class ChartDataProvider {
  
    static func createModels (count: Int) -> [ChartModel] {
        var models = [ChartModel] ()
        
        for i in 0..<count {
            let id = i + 1
            models.append(ChartModel(id: id, title: String(format: "Chart #%02d", id)))
        }
        
        return models
    }
    
    static let SeriesData : [(name: String, color: UIColor)] = [("Potatoes",UIColor.yellow),
                              ("Tomatoes", UIColor.red),
                              ("Cucumbers", UIColor.green)]
    
    static let exampleData : [DataPoint] = {
        
        var result = [DataPoint]()
        
        if let start = Date().startOfDay {
            let end = start.addingTimeInterval(TimeInterval.fromHours(23))
            var step = start
            while step <= end {
                result.append(DataPoint(timestamp: step, data: Int.random(in: 100..<200)))
                step = step.addingTimeInterval(TimeInterval.fromHours(1))
            }
        }
        
        return result
    }()
}


extension Array where Element : DataPointProtocol {
    func filtered(with existing: [Date]) -> [DataPointProtocol] {
        let allData = self as [DataPointProtocol]
            if existing.count < 1 {
                return allData
        }
            if let lastExisting = existing.last {
                if let earliestNew = self.first(where: { $0.timestamp > lastExisting }) {
                    return self.filter {$0.timestamp >= earliestNew.timestamp }
                }
            }
          return [DataPoint]()
        }
}

extension SCIXyDataSeries {
    func extractXValues () -> [Date] {
        
        let xValues = self.xValues()
        let count = Int(xValues.count())
        if count < 1 {
            return [Date]()
        }
        
        if let dataArray = xValues.data() {
            let typedArray = dataArray.bindMemory(to: Double.self, capacity: count)
            let array = Array(UnsafeBufferPointer(start: typedArray, count: count))
            let dateValues = array.map({  Date(timeIntervalSince1970: $0)   })
            
            return dateValues
        }
        
        return [Date]()
    }
}
