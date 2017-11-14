//
//  Dollar.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/12.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
struct Dollar {
    private var amount: Int
    init(amount: Int) {
        self.amount = amount
    }
    func times(multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }
}

extension Dollar: Equatable {
    public static func == (lhs: Dollar, rhs: Dollar) -> Bool {
        return lhs.amount == rhs.amount
    }
}
