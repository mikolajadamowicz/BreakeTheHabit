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
        
  
        centerTextLabel.center = pieChartView.centerCircleBox
        centerTextLabel.alpha = 0
        
    }
    


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
    func setChart(dataPoints: [String], values: [Double]) {
        
       // pieChartView.noDataText = "You need to provide data for the chart."

        
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry1 = ChartDataEntry(x: Double(i), y: values[i], data: dataPoints[i] as AnyObject)
            
            dataEntries.append(dataEntry1)
        }
        print(dataEntries[0].data)
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
        
        
        
        pieChartView.animate(xAxisDuration: 2)
        pieChartView.animate(yAxisDuration: 1.5, easingOption: ChartEasingOption.easeOutBack)
        //, easing: <#T##ChartEasingFunctionBlock?##ChartEasingFunctionBlock?##(TimeInterval, TimeInterval) -> Double#>)
    }
    
}

//extension ChartViewController : ChartViewDelegate {
//    
//    
//
//    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: Highlight) {
//        print("udalo sie ")
//    }
//
//        func onChartDoubleTapped(MotionEvent me)  {
//            print("double tap")
//        }
//
//    
//    
//    
//         func onChartSingleTapped(MotionEvent me){
//            print("single tap")
//        }
//
//}
