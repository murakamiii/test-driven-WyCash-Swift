//
//  Pair.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2018/12/29.
//  Copyright © 2018 MURAKAMI. All rights reserved.
//

import Foundation

struct Pair {
    private(set) var from: String
    private(set) var to: String
}

extension Pair: Hashable {
    var hashValue: Int {
        return 0
    }
    
    public static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to
    }
}
