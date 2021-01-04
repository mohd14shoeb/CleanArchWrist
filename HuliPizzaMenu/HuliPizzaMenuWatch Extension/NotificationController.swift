//
//  NotificationController.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/27/20.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var bodyText:String = ""
    var id:Int = 0
    override var body: NotificationView {
        return NotificationView(bodyText:bodyText,id:id)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        let content = notification.request.content
        bodyText = content.body
        id = content.userInfo["id"] as? Int ?? 0
    }
}
