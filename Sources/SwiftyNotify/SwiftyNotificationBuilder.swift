//
//  SwiftyNotificationBuilder.swift
//  SwiftyNotify
//
//  Created by Corey Pett on 27.10.23.
//

import UIKit

public protocol SwiftyNotificationBuilderProtocol {
    func dispachOn(_ queue: DispatchQueue) -> SwiftyNotificationBuilderProtocol
    func onEvent(_ event: @escaping ValueClosure<Notification>)
}

final class SwiftyNotificationBuilder: SwiftyNotificationBuilderProtocol {
    private let name: Notification.Name
    private var queue: DispatchQueue?

    var notificationDidCreate: ValueClosure<NotifyWhen>?

    init(name: Notification.Name) {
        self.name = name
    }

    func dispachOn(_ queue: DispatchQueue) -> SwiftyNotificationBuilderProtocol {
        self.queue = queue
        return self
    }

    func onEvent(_ event: @escaping ValueClosure<Notification>) {
        notificationDidCreate?(NotifyWhen(name, queue, event))
    }
}
