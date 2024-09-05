//
//  NotifyWhenHelper.swift
//  SwiftyNotify
//
//  Created by Corey Pett on 12/21/19.
//  Copyright © 2019 Corey Pett. All rights reserved.
//

import UIKit

public final class SwiftyNotifier: NSObject {
    private var notifications: [NotifyWhen]

    public override init() {
        notifications = [NotifyWhen]()
    }

    public func when(_ name: Notification.Name) -> SwiftyNotificationBuilderProtocol {
        let builder = SwiftyNotificationBuilder(name: name)
        builder.notificationDidCreate = { [weak self] notification in
            self?.notifications.append(notification)
        }
        return builder
    }

    /// Subscription on Notification with async on main queue
    public func when(_ name: Notification.Name, _ event: @escaping ValueClosure<Notification>) {
        let builder = SwiftyNotificationBuilder(name: name)
        builder.notificationDidCreate = { [weak self] notification in
            self?.notifications.append(notification)
        }
        builder
            .dispachOn(.main)
            .onEvent(event)
    }
}
