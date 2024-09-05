//
//  NotifyWhen.swift
//  SwiftyNotify
//
//  Created by Corey Pett on 12/19/19.
//  Copyright © 2019 Corey Pett. All rights reserved.
//

import UIKit

final class NotifyWhen: NSObject {
    let notificationWrapper: NotificationWrapper

    init(_ name: String, _ queue: DispatchQueue?, _ event: @escaping ValueClosure<Notification>) {
        notificationWrapper = NotificationWrapper(name: name, dispatchQueue: queue)

        super.init()

        notificationWrapper.event.add { notification in
            /// We don't need use async here because TWEventer already has this logic
            DispatchQueue.main.async {
                event(notification)
            }
        }
    }

    convenience init(_ name: Notification.Name, _ queue: DispatchQueue?, _ event: @escaping ValueClosure<Notification>) {
        self.init(name.rawValue, queue, event)
    }
}
