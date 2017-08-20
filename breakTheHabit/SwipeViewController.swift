//
//  ChartViewController.swift
//  breakTheHabit
//
//  Created by Mikolaj Adamowicz on 09.08.2017.
//  Copyright © 2017 Mikolaj Adamowicz. All rights reserved.
//

import Foundation
import EZSwipeController

class  SwipeViewController: EZSwipeController {
    
    let redVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActivitiesViewController") as? ActivitiesViewController
    
    let blueVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChartViewController") as? ChartViewController
    
    let greenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HabitsViewController") as? HabitsViewController
    
    override func setupView() {
        datasource = self as! EZSwipeControllerDataSource
    }
}

extension SwipeViewController: EZSwipeControllerDataSource {
    
    func viewControllerData() -> [UIViewController] {
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        
//        let redVC = sb.instantiateViewController(withIdentifier: "ActivitiesViewController") as? ActivitiesViewController
//        
//        let blueVC = sb.instantiateViewController(withIdentifier: "ChartViewController") as? ChartViewController
//        
//        let greenVC = sb.instantiateViewController(withIdentifier: "HabitsViewController") as? HabitsViewController
//        greenVC?.view.backgroundColor = UIColor.green
        
        return [redVC!, blueVC!, greenVC!]
    }
    
    func indexOfStartingPage() -> Int {
        return 1 // EZSwipeController starts from 2nd, green page
    }
    
    func changedToPageIndex(_ index: Int) {
        if index == 1 {
            blueVC?.viewDidLoad()
        }
        
    }

}
