//
//  APIControllerTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
@testable import HararooAssesment

class APIControllerTests: XCTestCase {

    var newsAPIController: NewsAPIController!
    
    override func setUp() {
        super.setUp()
        newsAPIController = NewsAPIController()
    }
    
    override func tearDown() {
        newsAPIController = nil
        super.tearDown()
    }

    func test_getMostViewedNews() {
        
        let testExpectation = expectation(description: "test_getMostViewedNews should not return an error")
        newsAPIController.getNewsApi() { (_, error) in
            XCTAssertNil(error)
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
