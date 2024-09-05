//
//  File.swift
//  
//
//  Created by Corey Pett on 9/5/24.
//

import Foundation

class Eventer<T> {
    typealias Callback = ValueClosure<T>
    internal let uniqueCallbackId: Int = -1

    private lazy var callbacks = [Int: Callback]()
    private var counter = 0

    convenience init(_ callback: @escaping Callback) {
        self.init()
        add(callback)
    }

    @discardableResult
    public func add(_ callback: @escaping Callback) -> Int {
        callbacks[counter] = callback
        counter += 1
        return counter - 1
    }

    /// Will automatically replace previous addOnce callback
    public func addOnce(_ callback: @escaping Callback) {
        // remove previous callback if existing and add new one
        callbacks[uniqueCallbackId] = callback
    }

    @discardableResult
    public func removeAllThenAdd(_ callback: @escaping Callback) -> Int {
        tearDown()
        return add(callback)
    }

    public func remove(_ callbackId: Int) {
        // removed id will not be reused for dictionary key again
        callbacks.removeValue(forKey: callbackId)
    }

    public func trigger(_ data: T) {
        for (_, callback) in callbacks {
            callback(data)
        }
    }

    public func tearDown() {
        callbacks.removeAll()
        counter = 0
    }

    public func getSize() -> Int {
        callbacks.count
    }

    internal func isCallbackIdValid(_ callbackId: Int) -> Bool {
        callbackId >= uniqueCallbackId && callbacks[callbackId] != nil
    }

    deinit {
        tearDown()
    }
}
