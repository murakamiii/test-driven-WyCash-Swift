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
        let five: Money = Money.dollar(amount: 5)
        
        XCTAssertEqual(Money.dollar(amount: 10).equatable, five.times(multiplier: 2).equatable)
        XCTAssertEqual(Money.dollar(amount: 15).equatable, five.times(multiplier: 3).equatable)
    }
    
    func testEquality() {
        XCTAssertTrue(Money.dollar(amount: 5).equatable == Money.dollar(amount: 5).equatable)
        XCTAssertFalse(Money.dollar(amount: 5).equatable == Money.dollar(amount: 6).equatable)
        XCTAssertFalse(Money.franc(amount: 5).equatable == Money.dollar(amount: 5).equatable)
    }

    func testCurrency() {
        XCTAssertEqual("USD", Money.dollar(amount: 1).currency)
        XCTAssertEqual("CHF", Money.franc(amount: 1).currency)
    }
    func testSimpleAddition() {
        let sum: Sum = Money.dollar(amount: 5) + Money.dollar(amount: 5)
        let bank: Bank = Bank()
        let summarized: Money = bank.summarized(sum, currency: "USD")
        XCTAssertEqual(Money.dollar(amount: 10).equatable, summarized.equatable)
    }
    func testPlusReturnsSum() {
        let five = Money.dollar(amount: 5)
        let sum: Sum = five + five
        XCTAssertEqual(five.equatable, sum.augend)
        XCTAssertEqual(five.equatable, sum.addend)
    }
    func testSummarizeSum() {
        let sum: Expression = Sum(augend: Money.dollar(amount: 3).equatable, addend: Money.dollar(amount: 4).equatable)
        let bank: Bank = Bank()
        let result: Money = bank.summarized(sum, currency: "USD")
        XCTAssertEqual(Money.dollar(amount: 7).equatable, result.equatable)
    }
    func testSummarizeMoney() {
        let bank = Bank()
        let result: Money = bank.summarized(Money.dollar(amount: 1), currency: "USD")
        XCTAssertEqual(Money.dollar(amount: 1).equatable, result.equatable)
    }
    func testSummarizeMoneyDifferentCurrency() {
        let bank = Bank()
        bank.addRate(from: "CHF", to: "USD", rate: 2)
        let result = bank.summarized(Money.franc(amount: 2), currency: "USD")
        XCTAssertEqual(Money.dollar(amount: 1).equatable, result.equatable)
    }
    func testIdentityRate() {
        XCTAssertEqual(1, Bank.init().getRate(from: "USD", to: "USD"))
    }
    
    func testMixedAddition() {
        let fiveBucks: AnyExpression = Money.dollar(amount: 5).equatable
        let tenFrancs: AnyExpression = Money.franc(amount: 10).equatable
        let bank: Bank = Bank()
        bank.addRate(from: "CHF", to: "USD", rate: 2)
        let result: Money = bank.summarized(fiveBucks + tenFrancs, currency: "USD")
        XCTAssertEqual(Money.dollar(amount: 10).equatable, result.equatable)
    }
    
    func testSumPlusmoney() {
        let fiveBucks: AnyExpression = Money.dollar(amount: 5).equatable
        let tenFrancs: AnyExpression = Money.franc(amount: 10).equatable
        let bank: Bank = Bank()
        bank.addRate(from: "CHF", to: "USD", rate: 2)
        let sum: Expression = Sum(augend: fiveBucks, addend: tenFrancs) + fiveBucks
        let result: Money = bank.summarized(sum, currency: "USD")
        XCTAssertEqual(Money.dollar(amount: 15).equatable, result.equatable)
    }
    
    func testSumTimes() {
        let fiveBucks: AnyExpression = Money.dollar(amount: 5).equatable
        let tenFrancs: AnyExpression = Money.franc(amount: 10).equatable
        let bank: Bank = Bank()
        bank.addRate(from: "CHF", to: "USD", rate: 2)
        let sum: Expression = Sum(augend: fiveBucks, addend: tenFrancs).times(multiplier: 2)
        let result: Money = bank.summarized(sum, currency: "USD")
        XCTAssertEqual(Money.dollar(amount: 20).equatable, result.equatable)
    }
}
