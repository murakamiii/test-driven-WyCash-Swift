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
        let five: Dollar = Dollar(amount: 5)
        
        XCTAssertEqual(Dollar(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Dollar(amount: 15), five.times(multiplier: 3))
    }
    
    func testEquality() {
        XCTAssertTrue(Dollar(amount: 5) == Dollar(amount: 5))
        XCTAssertFalse(Dollar(amount: 5) == Dollar(amount: 6))
        
        XCTAssertTrue(Franc(amount: 5) == Franc(amount: 5))
        XCTAssertFalse(Franc(amount: 5) == Franc(amount: 6))
    }
    
    func testFrancMultiplication() {
        let five: Franc = Franc(amount: 5)
        
        XCTAssertEqual(Franc(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Franc(amount: 15), five.times(multiplier: 3))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
