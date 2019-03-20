//
//  ChartCollectionCell.swift
//  SciChartDemo
//
//  Created by Admin on 04/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SciChart

class ChartCollectionCell: UICollectionViewCell {
    
    static let ReuseIdentifier = "ChartCell"
    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var surfaceView: UIView!
    
    func initialize () {
        let _ = ChartRenderer(surfaceView: surfaceView)
    }
    
}

struct ChartRenderer {
    
    let chartSurface : SCIChartSurface
    
    init(surfaceView: UIView) {
        chartSurface = SCIChartSurface(frame: surfaceView.bounds)
        chartSurface.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        chartSurface.translatesAutoresizingMaskIntoConstraints = true
        surfaceView.addSubview(chartSurface)
        
        createAxes()
        createSeries()
    }
    
    func destroy () {
        chartSurface.xAxes.clear()
        chartSurface.yAxes.clear()
        chartSurface.renderableSeries.clear()
        chartSurface.removeFromSuperview()
    }
    
    private func createAxes () {
        let xAxis = SCIDateTimeAxis()
        xAxis.axisAlignment = .bottom
        xAxis.autoRange = .once
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        xAxis.axisTitle = "Time"
        xAxis.textFormatting = "HH"
        xAxis.isLabelCullingEnabled = true
        xAxis.style.drawMajorTicks = false
        xAxis.style.drawMinorTicks = false
        xAxis.style.drawMajorGridLines = false
        xAxis.style.drawMinorGridLines = false
        
        let yAxis = SCINumericAxis()
        yAxis.autoRange = .always
        yAxis.axisAlignment = .left
        xAxis.majorDelta = SCIGeneric(TimeInterval.fromHours(1))
        xAxis.minorDelta = SCIGeneric(TimeInterval.fromHours(1))
        xAxis.autoTicks = false
        xAxis.visibleRange = DateHelper.range()
        xAxis.visibleRangeLimit = DateHelper.range()
        xAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.0), max: SCIGeneric(0.4))
        yAxis.style.drawMajorGridLines = false
        yAxis.style.drawMinorGridLines = false
        yAxis.style.drawMajorTicks = false
        yAxis.style.drawMinorTicks = false
        chartSurface.xAxes.add(xAxis)
        chartSurface.yAxes.add(yAxis)
    }
    
    private func createSeries () {
        let collection = SCIHorizontallyStackedColumnsCollection()
        
        let strokeColor = UIColor.black
        
        ChartDataProvider.SeriesData.forEach {
            let dataSeries = SCIXyDataSeries(xType: .dateTime, yType: SCIDataType.int32)
            dataSeries.seriesName = $0.name
            let data = ChartDataProvider.exampleData
            data.forEach {
                dataSeries.appendX(SCIGeneric($0.timestamp), y: SCIGeneric($0.data))
            }
            let barWidth = 0.5
            let baseColor = $0.color
            let fadingColor = baseColor.withAlphaComponent(0.2)
            
            let columnSeries = SCIStackedColumnRenderableSeries()
            columnSeries.dataSeries = dataSeries
            
            columnSeries.strokeStyle = SCISolidPenStyle(color: strokeColor, withThickness: 1.0)
            columnSeries.style.fillBrushStyle = SCILinearGradientBrushStyle(colorStart: baseColor, finish: fadingColor, direction: .vertical)
            columnSeries.style.dataPointWidth = barWidth
            
            collection.add(columnSeries)
        }
        
        SCIUpdateSuspender.usingWithSuspendable(chartSurface, with: {
            self.chartSurface.renderableSeries.add(collection)
            
        })
//        ChartDataSource.SeriesData.forEach {
//            let dataSeries = SCIXyDataSeries(xType: .dateTime, yType: .double)
//            dataSeries.fifoCapacity = 1000
//            dataSeries.seriesName = $0.name
//
//            let majorColor = $0.color
//            let fadingColor = majorColor.withAlphaComponent(0.2)
//
//
//            let renderableSeries = SCIFastMountainRenderableSeries()
//            renderableSeries.strokeStyle = SCISolidPenStyle(color: majorColor, withThickness: 1.0)
//            renderableSeries.areaStyle = SCILinearGradientBrushStyle(colorStart: majorColor, finish: fadingColor, direction: .vertical)
//            renderableSeries.dataSeries = dataSeries
//
//            SCIUpdateSuspender.usingWithSuspendable(chartSurface) {
//                self.chartSurface.renderableSeries.add(renderableSeries)
//            }
//        }
    }
    
//    func add(data: [DataPoint], to series: String) {
//        for i in 0..<chartSurface.renderableSeries.count() {
//            if let dataSeries = chartSurface.renderableSeries.item(at: UInt32(i))?.dataSeries as? SCIXyDataSeries {
//                if dataSeries.seriesName?.elementsEqual(series) == true {
//                    let dateValues = dataSeries.extractXValues()
//                    let filtered = data.filtered(with: dateValues)
//                    filtered.forEach { (dp) in
//                        dataSeries.appendX(SCIGeneric(dp.timestamp), y: SCIGeneric(dp.data))
//                    }
//
//                    //updateXAxisRange(for: filtered)
//                }
//            }
//        }
//    }
    
    
    
    
    
}
