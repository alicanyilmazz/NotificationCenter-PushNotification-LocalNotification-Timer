//
//  ViewController.swift
//  PushNotification
//
//  Created by alican on 21.11.2021.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    var permissionControl : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using for foregorund notifications
        UNUserNotificationCenter.current().delegate = self

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge]) { granted, error in
            self.permissionControl = granted
            if granted{
               print("Permission was confirmed.")
            }else{
               print("Permission was not confirmed.")
            }
        }
    }
    
    
    @IBAction func createNotification(_ sender: UIButton) {
        
        if permissionControl{
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "SubTitle"
            content.body = "Message"
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let notificationRequest = UNNotificationRequest(identifier: "XNotification", content: content, trigger: trigger)
            
            // we use withCompletionHandler to take another action when the notification is clicked.
            UNUserNotificationCenter.current().add(notificationRequest, withCompletionHandler: nil)
        }
    }
}

// This extension using for foreground notifications
extension ViewController : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner , .sound , .badge])
    }
}
