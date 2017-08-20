//
//  ChartViewController.swift
//  breakTheHabit
//
//  Created by Mikolaj Adamowicz on 09.08.2017.
//  Copyright © 2017 Mikolaj Adamowicz. All rights reserved.
//

import Foundation
import EZSwipeController

class  ChartViewController: EZSwipeController {
    override func setupView() {
        datasource = self as! EZSwipeControllerDataSource
    }
}

extension ChartViewController: EZSwipeControllerDataSource {
    func viewControllerData() -> [UIViewController] {
        
        var sb = UIStoryboard(name: "Main", bundle: nil)
        
        let redVC = UIViewController()
        redVC.view.backgroundColor = UIColor.red
        
        let blueVC = sb.instantiateViewController(withIdentifier: "HabitsViewController") as? HabitsViewController
        blueVC?.view.backgroundColor = UIColor.blue
        
        let greenVC = UIViewController()
        greenVC.view.backgroundColor = UIColor.green
        
        return [redVC, blueVC!, greenVC]
    }
}
