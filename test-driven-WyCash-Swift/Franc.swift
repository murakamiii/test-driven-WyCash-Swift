//
//  Franc.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/14.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
struct Franc: Money {
    private(set) var amount: Int
    let currency: String

    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    func times(multiplier: Int) -> Franc {
        return MoneyStruct.franc(amount: amount * multiplier)
    }
}

