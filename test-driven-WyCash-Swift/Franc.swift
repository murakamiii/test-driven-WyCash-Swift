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
    init(amount: Int) {
        self.amount = amount
    }
    func times(multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }
}

