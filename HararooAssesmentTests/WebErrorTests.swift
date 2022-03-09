//
//  WebErrorTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
import CoreData
@testable import HararooAssesment

class WebErrorTests: XCTestCase {
    
    var mockAPIController: MockAPIControllernoInternetError!
    var mockAPIControllerBadRequest: MockAPIControllerBadRequest!
    override func setUp() {
        super.setUp()
        mockAPIControllerBadRequest = MockAPIControllerBadRequest()
        mockAPIController = MockAPIControllernoInternetError()
 
    }
    
    override func tearDown() {
        mockAPIController = nil
        super.tearDown()
    }
    
    func test_noInternetWeberror() {
        // Since we are returning 3 APINews objects in mockAPIController inside the NewsListViewModel
        var nsEror : WebServiceError? = nil
        mockAPIController.getNewsApi { data, Error in
            nsEror = (Error as! WebServiceError)
        }
        XCTAssertEqual(nsEror!.errorDescription, WebServiceError.noInternetError.errorDescription)
    }
    func test_badRrequesstWebError() {
        // Since we are returning 3 APINews objects in mockAPIController inside the NewsListViewModel
        var nsEror : WebServiceError? = nil
        mockAPIControllerBadRequest.getNewsApi { data, Error in
            nsEror = (Error as! WebServiceError)
        }
        XCTAssertEqual(nsEror!.errorDescription, WebServiceError.badRequest.errorDescription)
    }
}

