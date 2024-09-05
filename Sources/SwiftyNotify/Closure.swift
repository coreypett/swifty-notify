//
//  File.swift
//  
//
//  Created by Corey Pett on 9/5/24.
//

import Foundation

public typealias Closure<Value, Result> = (Value) -> Result
public typealias ValueClosure<Value> = Closure<Value, Void>
public typealias ResultClosure<Result> = () -> Result
public typealias VoidClosure = ResultClosure<Void>
