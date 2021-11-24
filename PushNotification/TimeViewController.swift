//
//  TimeViewController.swift
//  PushNotification
//
//  Created by alican on 22.11.2021.
//

import UIKit

class TimeViewController: UIViewController {

var permissionControl : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge]) { granted, error in
            self.permissionControl = granted
            if granted{
               print("Permission was confirmed.")
            }else{
               print("Permission was not confirmed.")
            }
        }
    }
    

    @IBAction func sendNotificationClicked(_ sender: UIButton) {
        if permissionControl{
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "SubTitle"
            content.body = "Message"
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            var date = DateComponents()
            date.day = 22
            date.month = 11
            date.year = 2021
            date.hour = 17
            date.minute = 48
            
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            let notificationRequest = UNNotificationRequest(identifier: "XNotification", content: content, trigger: trigger)
            
            // we use withCompletionHandler to take another action when the notification is clicked.
            UNUserNotificationCenter.current().add(notificationRequest, withCompletionHandler: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
