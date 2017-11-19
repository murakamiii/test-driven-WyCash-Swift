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
    var currency: String {get}
}

extension Money {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }
}

struct MoneyStruct: Money {
    private(set) var amount: Int
    var currency: String
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    func times(multiplier: Int) -> MoneyStruct {
        return MoneyStruct.init(amount: amount * multiplier, currency: currency)
    }
    
    static func dollar(amount: Int) -> MoneyStruct {
        return MoneyStruct.init(amount: amount, currency: "USD")
    }
    
    static func franc(amount: Int) -> MoneyStruct {
        return MoneyStruct.init(amount: amount, currency: "CHF")
    }
}

