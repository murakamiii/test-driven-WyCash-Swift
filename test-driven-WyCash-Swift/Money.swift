//
//  Money.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/15.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
protocol Money: Equatable {
    var amount: Int {get}
}

extension Money {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.amount == rhs.amount
    }
}

struct MoneyStruct: Money {
    private(set) var amount: Int
    
    static func dollar(amount: Int) -> Dollar {
        return Dollar(amount: amount)
    }
    
    static func franc(amount: Int) -> Franc {
        return Franc(amount: amount)
    }
}

