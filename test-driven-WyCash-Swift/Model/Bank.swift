//
//  Bank.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2018/12/29.
//  Copyright © 2018 MURAKAMI. All rights reserved.
//

import Foundation

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
