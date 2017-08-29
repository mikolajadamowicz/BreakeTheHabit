//
//  ChartViewController.swift
//  breakTheHabit
//
//  Created by Mikolaj Adamowicz on 11.08.2017.
//  Copyright © 2017 Mikolaj Adamowicz. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var pieChartView: PieChartView!  //PieChartView
    
    @IBOutlet weak var centerTextLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var dataSetIndexToDeselect : Int = 0
    
    // (red: 0, green: 0, blue: 0, alpha: 0.5)
    //    {
    //        var paragraphStyle = NSMutableParagraphStyle()
    //        paragraphStyle.alignment = .center
    //        centerText.a
    //        centerText.setAttributes([NSForegroundColorAttributeName: UIColor.red,
    //                                  NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0),
    //                                  NSParagraphStyleAttributeName: paragraphStyle],
    //                                 range: NSRange(location: 0, length: centerText.length))
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [10.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        pieChartView.delegate = self
        
        
        setChart(dataPoints: months, values: unitsSold)
        
        //updateChartData()
        centerTextLabel.center = pieChartView.centerCircleBox
        centerTextLabel.alpha = 0
        
    }
    
    //MARK: selecting chart value
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        UIView.animate(withDuration: 0.33, animations: {    self.centerTextLabel.alpha = 1   })
        dataSetIndexToDeselect = highlight.dataSetIndex
        print(highlight.description)
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        UIView.animate(withDuration: 0.33, animations: {    self.centerTextLabel.alpha = 0   })
        print("niezaznaczone")
    }
    
    //    @IBAction func buttonClick(sender: AnyObject) {
    //        pieChartView.highlightValue(xIndex: -1, dataSetIndex: dataSetIndexToDeselect, callDelegate: false)
    //    }
    
    
    //MARK: IBActions
    
    @IBAction func changeDateCategory(_ sender: UIButton) {
        switch sender.title(for: .normal)! {
        case "Year":
            dateLabel.text = "Year"
        case "Month":
            dateLabel.text = "Month"
        case "Week":
            dateLabel.text = "Week"
        case "Day":
            dateLabel.text = "Day"
        default:
            print("Cos poszlo nie tak buttony kategorii")
        }
    }
    
    @IBAction func changeDate(_ sender: UIButton) {
        pieChartView.reloadInputViews()
        pieChartView.animate(xAxisDuration: 2)
        pieChartView.animate(yAxisDuration: 1.5, easingOption: ChartEasingOption.easeOutBack)
        
    }
    
    
    // MARK: Fetching chart data
    
    func updateChartData()  {
        
        let chart = PieChartView(frame: self.view.frame)
        // 2. generate chart data entries
        let track = ["Income", "Expense", "Wallet", "Bank"]
        let money = [650, 456.13, 78.67, 856.52]
        
        var entries = [PieChartDataEntry]()
        for (index, value) in money.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = track[index]
            entries.append( entry)
        }
        
        // 3. chart setup
        let set = PieChartDataSet( values: entries, label: "Pie Chart")
        // this is custom extension method. Download the code for more details.
        var colors: [UIColor] = []
        
        for _ in 0..<money.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        set.colors = colors
        let data = PieChartData(dataSet: set)
        chart.data = data
        chart.noDataText = "No data available"
        // user interaction
        chart.isUserInteractionEnabled = false
        
        let d = Description()
        d.text = "iOSCharts.io"
        chart.chartDescription = d
        chart.centerText = "Pie Chart"
        chart.holeRadiusPercent = 0.2
        chart.transparentCircleColor = UIColor.clear
        self.view.addSubview(chart)
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        // pieChartView.noDataText = "You need to provide data for the chart."
        
        
        
        var dataEntries = [PieChartDataEntry]()
        
        for i in 0..<dataPoints.count {
            let dataEntry1 = PieChartDataEntry(value: values[i], label: dataPoints[i])

            
            dataEntries.append(dataEntry1)
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
        pieChartView.usePercentValuesEnabled = true
        
        let d = Description()
        d.text = "iOSCharts.io"
        pieChartView.chartDescription = d
        pieChartView.animate(xAxisDuration: 2)
        pieChartView.animate(yAxisDuration: 1.5, easingOption: ChartEasingOption.easeOutBack)
        
    }
    
}

