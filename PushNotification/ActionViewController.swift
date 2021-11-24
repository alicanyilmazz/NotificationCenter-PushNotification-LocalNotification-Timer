//
//  ActionViewController.swift
//  PushNotification
//
//  Created by alican on 24.11.2021.
//

import UIKit
import UserNotifications

class ActionViewController: UIViewController {

    var permissionControl : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func sendNotification(_ sender: UIButton) {
        if permissionControl{
            
            // option : .foreground -> Opens the Application when clicked | .destructive --> clear the notification
            let acceptAction = UNNotificationAction(identifier: "acceptActionId", title: "accept", options: .foreground)
            let rejectAction = UNNotificationAction(identifier: "rejectActionId", title: "reject", options: .foreground)
            let deleteAction = UNNotificationAction(identifier: "deleteActionId", title: "delete", options: .destructive)
            
            let questionCategory = UNNotificationCategory(identifier: "categoryId", actions: [acceptAction,rejectAction,deleteAction], intentIdentifiers: [], options: [])
            
            UNUserNotificationCenter.current().setNotificationCategories([questionCategory])
            
            let content = UNMutableNotificationContent()
            content.title = "New Season"
            content.subtitle = "Big Sale"
            content.body = "Would you like to buy something?"
            content.badge = 1
            content.sound = UNNotificationSound.default
            
            content.categoryIdentifier = "categoryId"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let notificationRequest = UNNotificationRequest(identifier: "XNotification", content: content, trigger: trigger)
            
            // we use withCompletionHandler to take another action when the notification is clicked.
            UNUserNotificationCenter.current().add(notificationRequest, withCompletionHandler: nil)
        }
    }
}

// This extension using for foreground notifications
extension ActionViewController : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner , .sound , .badge])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

        let app = UIApplication.shared
        
        if app.applicationState == .active{
            print("clicked when on foregorund.")
            app.applicationIconBadgeNumber = 0
        }
        
        if app.applicationState == .inactive{
            print("clicked when on background.")
            app.applicationIconBadgeNumber = 0
        }
        
        if response.actionIdentifier == "acceptActionId"{
            print("accept clicked!")
        }
        
        if response.actionIdentifier == "rejectActionId"{
            print("reject clicked!")
        }
        
        if response.actionIdentifier == "deleteActionId"{
            print("delete clicked!")
        }
        
        
        completionHandler()
    }
}
