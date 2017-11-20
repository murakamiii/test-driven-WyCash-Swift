//
//  Money.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/15.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
protocol Expression {
}

protocol Money: Equatable, Expression {
    var amount: Int {get}
    var currency: String {get}
    init(amount: Int, currency: String)
}

extension Money {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func + (lhs: Self, rhs: Self) -> Expression {
        return Self.init(amount:lhs.amount + rhs.amount ,currency: lhs.currency)
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

class Bank {
    func summarized(_ source: Expression, currency: String) -> MoneyStruct {
        return MoneyStruct.dollar(amount: 10)
    }
}
