//
//  WebServiceTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
@testable import HararooAssesment

class WebServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_callGetMostViewedNewsAPI() {
        
        let testExpectation = expectation(description: "Should return list of Most Viewed News")
        
        GetNewsListConfigration().start { (response) in
            switch response {
            case let .success(response):
                XCTAssertNotNil(response)
            case let .failure(error):
                XCTFail("web service error: \(error)")
            }
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

}
