//
//  test_driven_WyCash_SwiftTests.swift
//  test-driven-WyCash-SwiftTests
//
//  Created by MURAKAMI on 2017/11/11.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import XCTest
@testable import test_driven_WyCash_Swift

class test_driven_WyCash_SwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMultiplication() {
        let five: MoneyStruct = MoneyStruct.dollar(amount: 5)
        
        XCTAssertEqual(MoneyStruct.dollar(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(MoneyStruct.dollar(amount: 15), five.times(multiplier: 3))
    }
    
    func testEquality() {
        XCTAssertTrue(MoneyStruct.dollar(amount: 5) == MoneyStruct.dollar(amount: 5))
        XCTAssertFalse(MoneyStruct.dollar(amount: 5) == MoneyStruct.dollar(amount: 6))
        XCTAssertFalse(MoneyStruct.franc(amount: 5) == MoneyStruct.dollar(amount: 5))
    }

    func testCurrency() {
        XCTAssertEqual("USD", MoneyStruct.dollar(amount: 1).currency)
        XCTAssertEqual("CHF", MoneyStruct.franc(amount: 1).currency)
    }
}
