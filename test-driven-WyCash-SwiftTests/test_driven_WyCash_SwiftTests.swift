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
        
        var product = five.times(multiplier: 2)
        XCTAssertEqual(10, product.amount)
        
        product = five.times(multiplier: 3)
        XCTAssertEqual(15, product.amount)
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
