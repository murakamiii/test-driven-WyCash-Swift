//
//  Money.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/15.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
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

class Bank {
    private(set) var rates: [Pair: Int]
    init() {
        self.rates = [:]
    }
    func summarized(_ source: Expression, currency: String) -> Money {
        return source.summarized(bank: self, currencyTo: currency)
    }
    func addRate(from: String, to: String, rate: Int) {
        rates[Pair.init(from: from, to: to)] = rate
    }
    func getRate(from: String, to: String) -> Int {
        if from == to {
            return 1
        }
        return rates[Pair.init(from: from, to: to)]!
    }
    
}

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
