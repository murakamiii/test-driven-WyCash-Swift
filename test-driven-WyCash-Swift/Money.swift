//
//  Money.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/15.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
protocol Expression {
    func summarized(currency: String) -> MoneyStruct
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
    
    func summarized(currency: String) -> MoneyStruct {
        return self
    }
    
    static func dollar(amount: Int) -> MoneyStruct {
        return MoneyStruct.init(amount: amount, currency: "USD")
    }
    
    static func franc(amount: Int) -> MoneyStruct {
        return MoneyStruct.init(amount: amount, currency: "CHF")
    }
}

extension MoneyStruct {
    public static func + (lhs: MoneyStruct, rhs: MoneyStruct) -> Sum {
        return Sum.init(augend: lhs, addend: rhs)
    }
}

struct Sum: Expression {
    var augend: MoneyStruct
    var addend: MoneyStruct
    
    func summarized(currency: String) -> MoneyStruct {
        let amount: Int = augend.amount + addend.amount
        return MoneyStruct.init(amount: amount, currency: currency)
    }
}

class Bank {
    func summarized(_ source: Expression, currency: String) -> MoneyStruct {
        return source.summarized(currency: currency)
    }
}
