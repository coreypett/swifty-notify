//
//  File.swift
//  
//
//  Created by Corey Pett on 9/5/24.
//

import Foundation

typealias Closure<Value, Result> = (Value) -> Result
typealias ValueClosure<Value> = Closure<Value, Void>
typealias ResultClosure<Result> = () -> Result
typealias VoidClosure = ResultClosure<Void>
