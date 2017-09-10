//
//  DataManager.swift
//  breakTheHabit
//
//  Created by Mikolaj Adamowicz on 28.08.2017.
//  Copyright © 2017 Mikolaj Adamowicz. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    
    static let sharedInstance = DataManager()
    private init() {  }
    
        let calendar = Calendar.current
    
    enum partsOfDate {
        case year
        case month
        case day
    }
    


    
    //  color, activityName, TimeSpentDoingIt, TimeLimit (if not bad habit TimeLimit = none || 0, Date)
    var activity: (color: UIColor, activityName: String, timeSpentDoingIt: Double, timeLimit: Double, date: Date)?
        
    {
        didSet{
            addDateToArray(of: .day)
            addDateToArray(of: .month)
            //itp
        }
    }
//
//    struct Activity {
//       static var color = UIColor()
//       static var activityName = String()
//       static var timeSpentDoingIt = Double()
//       static var timeLimit = Double()
//       static var date = Date()
//    }
    
    var arrayOfActivities = [(color: UIColor, activityName: String, timeSpentDoingIt: Double,timeLimit: Double, date: Date)]()
    
    
    
    
 //  Days = ["17.08":["sleeping":(red, "Sleeping", 12, 10)]]
    var arrayOfDays = [Date]()
    var dayActivitiesName = [String]()
    var dayActivitiesColor = [UIColor]()
    var dayActivitiesTime = [Double]()
    
    var arrayOfMonths = [Date]()
    var monthActivities = [String:(String, Double, Double, Date)]()
    var monthActivitiesColor = [UIColor]()
    
    var arrayOfYears = [Date]()
    var yearActivities = [String:(String, Double, Double, Date)]()
    var yearActivitiesColor = [UIColor]()

    
 //   var dictionary ("month": ["activity1": value1, "activity2": value2])
    
    
    func addNameToArray(of: partsOfDate) {
        
        var partOfdate: Calendar.Component
        var array = [Date]()
        
        
        switch of {
        case .day:
            partOfdate = Calendar.Component.day
            array = arrayOfDays
        case .month:
            partOfdate = Calendar.Component.month
            array = arrayOfMonths
        case .year:
            partOfdate = Calendar.Component.year
            array = arrayOfYears
        }
        
        let previousDate: Date = arrayOfActivities[arrayOfActivities.endIndex - 2].date
        let newDate: Date = arrayOfActivities.last!.date
        
        if calendar.component(partOfdate, from: previousDate) != calendar.component(partOfdate, from: newDate) {
            array.append(newDate)
        }
        
    }
    
    
    func addColorToArray(of: partsOfDate) {
        
        var partOfdate: Calendar.Component
        var array = [Date]()
        
        
        switch of {
        case .day:
            partOfdate = Calendar.Component.day
            array = arrayOfDays
        case .month:
            partOfdate = Calendar.Component.month
            array = arrayOfMonths
        case .year:
            partOfdate = Calendar.Component.year
            array = arrayOfYears
        }
        
        let previousDate: Date = arrayOfActivities[arrayOfActivities.endIndex - 2].date
        let newDate: Date = arrayOfActivities.last!.date
        
        if calendar.component(partOfdate, from: previousDate) != calendar.component(partOfdate, from: newDate) {
            array.append(newDate)
        }
        
    }

    
    func addDateToArray(of: partsOfDate) {
        
        var partOfdate: Calendar.Component
        var array = [Date]()
        
        
        switch of {
        case .day:
            partOfdate = Calendar.Component.day
            array = arrayOfDays
        case .month:
            partOfdate = Calendar.Component.month
            array = arrayOfMonths
        case .year:
            partOfdate = Calendar.Component.year
            array = arrayOfYears
        }
       
        let previousDate: Date = arrayOfActivities[arrayOfActivities.endIndex - 2].date
        let newDate: Date = arrayOfActivities.last!.date
        
        if calendar.component(partOfdate, from: previousDate) != calendar.component(partOfdate, from: newDate) {
            array.append(newDate)
        }
        
    }
    
//    func addActivity() -> (name: [String],time: [Int]) {
//        
//        
//        
//    }
    
}
