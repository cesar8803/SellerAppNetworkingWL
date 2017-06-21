//
//  Dictionary+Union.swift
//  WorklightServices
//
//  Created by Derek Bowen on 4/9/15.
//  Copyright (c) 2015 Deloitte Digital. All rights reserved.
//

import Foundation

// Precedence goes to the values from the right ditionary
func + <K, V>(left: Dictionary<K, V>, right: Dictionary<K, V>) -> Dictionary<K, V>
{
    var map = Dictionary<K, V>()
    for (k, v) in left {
        map[k] = v
    }
    for (k, v) in right {
        map[k] = v
    }
    return map
}

// Precedence goes to the values from the right ditionary
func += <K, V> ( left: inout Dictionary<K, V>, right: Dictionary<K, V>) -> Dictionary<K, V>
{
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
    return left
}
