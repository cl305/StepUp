//
//  StatisticsViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/10/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import Charts

class StatisticsViewController: UIViewController {
    
    
    @IBOutlet var chartView: LineChartView!
    @IBOutlet var menuButton: UIBarButtonItem!
    
    
    var months: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 0]
        setChart(months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        //Chart attributes
        chartView.noDataText = "You need to provide data for the chart."
        chartView.descriptionText = ""
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        chartView.xAxis.labelPosition = .Bottom
        
        
        
        //Chart data
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        chartDataSet.setColor(UIColor(red: 0/255, green: 61/255, blue: 245/255, alpha: 1))
        chartDataSet.setCircleColor(UIColor(red: 0/255, green: 61/255, blue: 245/255, alpha: 1))
        chartDataSet.circleHoleColor = UIColor(red: 0/255, green: 61/255, blue: 245/255, alpha: 1)
        
        let chartData = LineChartData.self(xVals: dataPoints, dataSet: chartDataSet)
        
        chartView.data = chartData
    }
    
    
    
}