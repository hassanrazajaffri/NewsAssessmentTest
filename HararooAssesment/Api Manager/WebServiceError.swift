//
//  WebServiceError.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation

public enum WebServiceError: Error {
    
    /// There was no network connection
    case noInternetError
    
    /// There was an NSURLError
    case networkingError(Error)
    
    /// The response returned a non-2xx status code
    case badResponse(statusCode: Int)
    
    /// The response returned a non-2xx status code, with display message from server
    case serverError(displayMessage: String)
    
    /// The response returned a 400 error
    case badRequest
    
    /// The response returned a 401 error
    case unauthorisedError
    
    /// The response returned a 403 error
    case forbidden
    
    /// The response returned a 404 error
    case notFound
    
    /// The response returned a 405 error
    case methodNotAllowed
    
    /// The response returned a 409 error
    case conflict
    
    /// There was an invalid response from the server
    case invalidResponse
    
    /// The web service request was cancelled - Normally when another request of the same type is made
    case cancelled
    
    case noData
    
    case validationError
    
    /// The response returned a 2XX status code but API error, with display message from server
    case customError(_ displayMessage: String)
    
}

extension Error {
    
    var errorDescription: String {
        if self is WebServiceError {
            switch self as! WebServiceError {
            case .noInternetError:
                return "Please Check Your Internet Connectivity".localized()
            case .networkingError:
                return "Please Check Your Internet Connectivity".localized()
            case .badResponse:
                return "Data Not Found".localized()
            case .serverError:
                return "Data Not Found".localized()
            case .badRequest:
                return "Data Not Found".localized()
            case .unauthorisedError:
                return "Unauthorized".localized()
            case .forbidden:
                return "Unauthorized".localized()
            case .notFound:
                return "Data Not Found".localized()
            case .conflict:
                return "error.webservice.not-found".localized()
            case .invalidResponse:
                return "error.webservice.not-found".localized()
            case .cancelled:
                return "error.webservice.not-found".localized()
            case .noData:
                return "Data Not Found".localized()
            case .validationError:
                return "Validation Error".localized()
            case .methodNotAllowed:
                return "Method not allowed".localized()
            case .customError(let displayMessage):
                return displayMessage.localized()
            }
        }
        
        return (self as NSError).localizedDescription
    }
}
