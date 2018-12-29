//
//  Money.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/15.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation

struct Money: Expression {
    private(set) var amount: Int
    var currency: String
    var equatable: AnyExpression {
        return AnyExpression.init(self)
    }
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    func times(multiplier: Int) -> Expression {
        return Money.init(amount: amount * multiplier, currency: currency)
    }
    
    func summarized(bank: Bank, currencyTo: String) -> Money {
        let rate: Int = bank.getRate(from: currency, to: currencyTo)
        return Money.init(amount: self.amount / rate, currency: currencyTo)
    }
    
    static func dollar(amount: Int) -> Money {
        return Money.init(amount: amount, currency: "USD")
    }
    
    static func franc(amount: Int) -> Money {
        return Money.init(amount: amount, currency: "CHF")
    }
    
    public static func + (lhs: Money, rhs: Money) -> Sum {
        return Sum.init(augend: AnyExpression(lhs), addend: AnyExpression(rhs))
    }
}
