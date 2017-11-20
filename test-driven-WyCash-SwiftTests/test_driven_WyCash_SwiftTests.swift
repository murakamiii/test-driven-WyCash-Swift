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
    func testSimpleAddition() {
        let sum: Sum = MoneyStruct.dollar(amount: 5) + MoneyStruct.dollar(amount: 5)
        let bank: Bank = Bank()
        let summarized: MoneyStruct = bank.summarized(sum, currency: "USD")
        XCTAssertEqual(MoneyStruct.dollar(amount: 10), summarized)
    }
    func testPlusReturnsSum() {
        let five = MoneyStruct.dollar(amount: 5)
        let sum: Sum = five + five
        XCTAssertEqual(five, sum.augend)
        XCTAssertEqual(five, sum.addend)
    }
    func testSummarizeSum() {
        let sum: Expression = Sum.init(augend: MoneyStruct.dollar(amount: 3), addend: MoneyStruct.dollar(amount: 4))
        let bank: Bank = Bank()
        let result: MoneyStruct = bank.summarized(sum, currency: "USD")
        XCTAssertEqual(MoneyStruct.dollar(amount: 7), result)
    }
    func testSummarizeMoney() {
        let bank = Bank()
        let result: MoneyStruct = bank.summarized(MoneyStruct.dollar(amount: 1), currency: "USD")
        XCTAssertEqual(MoneyStruct.dollar(amount: 1), result)
    }
}
