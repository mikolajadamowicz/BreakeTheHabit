//
//  ViewController.swift
//  breakTheHabit
//
//  Created by Mikolaj Adamowicz on 04.08.2017.
//  Copyright © 2017 Mikolaj Adamowicz. All rights reserved.
//

import UIKit
import UserNotifications

class ActivitiesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var notificationButton: UIButton!
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 4
    
    var activitiesArray: [String] = ["","","","+"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        collectionView.reloadData()
    }
    
    @IBAction func send10SecNotification(_ sender: UIButton) {
        if isGrantedNotificationAccess{
            //add notification code here
            
            let content = UNMutableNotificationContent()
            content.title = "10 Second Notification Demo"
            content.subtitle = "From MakeAppPie.com"
            content.body = "Notification after 10 seconds - Your pizza is Ready!!"
            content.categoryIdentifier = "message"
            
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: 10.0,
                repeats: false)
            
            let request = UNNotificationRequest(
                identifier: "10.second.message",
                content: content,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(
                request, withCompletionHandler: nil)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activitiesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivitiesCollectionViewCell", for: indexPath) as! ActivitiesCollectionViewCell
        
        cell.activitiesButton.setTitle(activitiesArray[indexPath.row], for: .normal)
        // Configure the cell
        return cell
        
    }
    
    @IBAction func addActivity(_ sender: UIButton) {
        
        if sender.title(for: .normal) == "+" {
            activitiesArray.insert("", at: 0)
            collectionView.reloadData()
            
            performSegue(withIdentifier: "toActivityDetails", sender: self)
            
        }
        
    }

     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toActivityDetails" {
            if let destViewController = segue.destination as? ActivityDetailsViewController {
                
            }
        }
    }
    
}

extension ActivitiesViewController : UICollectionViewDelegateFlowLayout {
    
    
//    
//    //1
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //2
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow
//        
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }
//    
//    //3
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//    
//    // 4
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
}
