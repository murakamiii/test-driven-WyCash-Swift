//
//  Dollar.swift
//  test-driven-WyCash-Swift
//
//  Created by MURAKAMI on 2017/11/12.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import Foundation
struct Dollar: Money {
    private(set) var amount: Int
    let currency: String
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    func times(multiplier: Int) -> MoneyStruct {
        return MoneyStruct.init(amount: amount * multiplier, currency: currency)
    }
}
