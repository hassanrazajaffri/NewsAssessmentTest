//
//  StringTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
@testable import HararooAssesment

class StringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalized() {
        
        let defaultString = NSLocalizedString("string.test", comment: "")
        let utilityString = "string.test".localized()
        
        XCTAssertEqual(defaultString, utilityString)
    }
}
