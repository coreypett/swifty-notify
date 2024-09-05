//
//  NotificationWrapper.swift
//  SwiftyNotify
//
//  Created by Corey Pett on 12/19/19.
//  Copyright © 2019 Corey Pett. All rights reserved.
//

import UIKit

final class NotificationWrapper: NSObject {
    public lazy var event = Eventer<Notification>()

    @objc private func eventOccurred(_ notification: Notification) {
        event.trigger(notification)
    }

    init(name: String, dispatchQueue: DispatchQueue? = .main, object: AnyObject? = nil) {
        super.init()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(eventOccurred(_:)),
            name: NSNotification.Name(rawValue: name),
            object: object
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
