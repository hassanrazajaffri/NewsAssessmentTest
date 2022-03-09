//
//  FontTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
@testable import HararooAssesment

class FontTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFontWithSize() {
        
        let fontSize: CGFloat = 12.0
        let font = Font.regular.withSize(fontSize)
        
        XCTAssertEqual(font.pointSize, fontSize)
    }
}
