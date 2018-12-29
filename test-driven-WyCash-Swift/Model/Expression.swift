//
//  Expression.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2018/12/29.
//  Copyright © 2018 MURAKAMI. All rights reserved.
//

import Foundation

protocol Expression {
    func summarized(bank: Bank, currencyTo: String) -> Money
    var amount: Int { get }
    var currency: String { get }
    var equatable: AnyExpression { get }
}

struct AnyExpression: Expression, Equatable {
    private let expression: Expression
    var amount: Int {
        return self.expression.amount
    }
    var currency: String {
        return self.expression.currency
    }
    
    var equatable: AnyExpression {
        return self
    }
    
    func summarized(bank: Bank, currencyTo: String) -> Money {
        return self.expression.summarized(bank: bank, currencyTo: currencyTo)
    }
    
    init(_ expression: Expression) {
        self.expression = expression
    }
    
    static func ==(lhs: AnyExpression, rhs: AnyExpression) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func + (lhs: AnyExpression, rhs: AnyExpression) -> Sum {
        return Sum.init(augend: lhs, addend: rhs)
    }
    
    func times(multiplier: Int) -> Expression {
        return Money.init(amount: amount * multiplier, currency: currency)
    }
}
