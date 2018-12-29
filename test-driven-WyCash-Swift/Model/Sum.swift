//
//  Sum.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2018/12/29.
//  Copyright © 2018 MURAKAMI. All rights reserved.
//

import Foundation

struct Sum: Expression {
    var equatable: AnyExpression {
        return AnyExpression(self)
    }
    
    var amount: Int {
        return 0
    }
    
    var currency: String {
        return ""
    }
    
    var augend: AnyExpression
    var addend: AnyExpression
    
    func summarized(bank: Bank, currencyTo: String) -> Money {
        let amount: Int = augend.summarized(bank: bank, currencyTo: currencyTo).amount + addend.summarized(bank: bank, currencyTo: currencyTo).amount
        return Money.init(amount: amount, currency: currencyTo)
    }
    
    public static func + (lhs: Sum, rhs: AnyExpression) -> Sum {
        return Sum.init(augend: lhs.equatable, addend: rhs)
    }
    
    func times(multiplier: Int) -> Expression {
        return Sum.init(augend: augend.times(multiplier: multiplier).equatable, addend: addend.times(multiplier: multiplier).equatable)
    }
}
