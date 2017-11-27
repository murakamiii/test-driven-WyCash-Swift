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
}

struct Money: Equatable, Expression {
    private(set) var amount: Int
    var currency: String
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    func times(multiplier: Int) -> Money {
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
}

extension Money {
    public static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }
    
    public static func + (lhs: Money, rhs: Money) -> Sum {
        return Sum.init(augend: lhs, addend: rhs)
    }
}

struct Sum: Expression {
    var augend: Money
    var addend: Money
    
    func summarized(bank: Bank, currencyTo: String) -> Money {
        let amount: Int = augend.summarized(bank: bank, currencyTo: currencyTo).amount + addend.summarized(bank: bank, currencyTo: currencyTo).amount
        return Money.init(amount: amount, currency: currencyTo)
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
