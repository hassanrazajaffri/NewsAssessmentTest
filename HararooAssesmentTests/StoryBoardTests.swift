//
//  StoryBoardTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
@testable import HararooAssesment

@available(iOS 13.0, *)
class StoryBoardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    func testStoryboard() {
        let storyboad = UIStoryboard.MAIN
        XCTAssertNotNil(storyboad)
    }
    func testStoryboardController() {
        let storyboardID = "NewsListViewController"
        XCTAssertEqual(storyboardID, NewsListViewController.id)
    }
}
