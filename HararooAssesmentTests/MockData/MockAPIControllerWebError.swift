//
//  MockAPIController.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation
@testable import HararooAssesment

class MockAPIControllernoInternetError: NewsAPIController {
    override func getNewsApi(completion: @escaping (_ response: [ApiNews]?, _ error: Error?) -> Void) {
        completion(nil, getError())
    }
    func getError() -> WebServiceError {
        return WebServiceError.noInternetError
    }
   
}
class MockAPIControllerBadRequest: NewsAPIController {
    override func getNewsApi(completion: @escaping (_ response: [ApiNews]?, _ error: Error?) -> Void) {
        completion(nil, getError())
    }
    func getError() -> WebServiceError {
        return WebServiceError.badRequest
    }
   
}
