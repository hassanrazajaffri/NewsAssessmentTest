//
//  WebServiceConfiguration.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import UIKit

// MARK: - Utils

let baseUrl = URL(string: Constants.Server.getAllMostViewedNews)!

private let urlSession: URLSession = {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 120
    config.timeoutIntervalForResource = 120
    return URLSession(configuration: config)
}()

public enum WebServiceResult<R> {
    case success(Data?)
    case failure(WebServiceError)
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    
}

typealias QueryParameter = (name: String, value: AnyObject)

// MARK: - Config protocols

protocol WebServiceConfiguration {
    
    var method: HTTPMethod {get}
    var queryParameters: [QueryParameter]? { get }
    var imageData:Data?{ get }
    var requestBody: Data? { get }
    func configurationError(from statusCode: Int) throws
}

struct BadRequestResponse {
    
    typealias JSONFormat = [String: Any]
    
    let reasonCode: Int
    let description: String
    
    init(json: JSONFormat) throws {
        
        guard let reasonCode = json["num_results"] as? Int else { throw WebServiceError.invalidResponse }
        self.reasonCode = reasonCode
        guard let status = json["status"] as? String else { throw WebServiceError.invalidResponse }
        self.description = status
    }
}

// MARK: - Default configuration

extension WebServiceConfiguration {
    
    var method: HTTPMethod { return .get }
    var queryParameters: [QueryParameter]? { return nil }
    var imageData:Data?{ return nil }
    var requestBody: AnyObject? { return nil }
    var taskIdentifier: String { return String(describing: type(of: self)) }
    var includeAuthToken: Bool { return true }
    
    func configurationError(from statusCode: Int) throws {}
    
}

// MARK: - Request Execution

extension WebServiceConfiguration {
    
    @discardableResult
    func start(completion: @escaping (WebServiceResult<Data>) -> Void) -> URLSessionDataTask {
        
        DispatchQueue.main.async {
           // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            let parsedResponse = self.parseResponse(data: data, response: response, error: error)
            
            performUIUpdatesOnMain {
                completion(parsedResponse)
                urlSession.getAllTasks(completionHandler: { (tasks) in
                    if tasks.isEmpty {
                        DispatchQueue.main.async {
                           // UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
                    }
                })
            }
        }
        
        task.resume()
        
        return task
    }
    
    private var request: URLRequest {
        
        let url = baseUrl
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if let requestBody = requestBody {
            urlRequest.httpBody = requestBody
        }
        
        return urlRequest
    }
    
    
    private func parseResponse(data: Data?, response: URLResponse?, error: Error?) -> WebServiceResult<Data> {
        
        if let error = error as NSError? {
            
            if error.code == NSURLErrorNotConnectedToInternet {
                return .failure(.noInternetError)
            }
            
            if error.code == NSURLErrorCancelled {
                return .failure(.cancelled)
            }
            
            return .failure(.networkingError(error))
        }
        
        guard let statusCode = response?.httpStatusCode else { return .failure(.invalidResponse) }
        
        guard 200...299 ~= statusCode else {
            
            switch statusCode {
            case 400:
                return .failure(.badRequest)
            case 401:
                return .failure(.unauthorisedError)
            case 403:
                return .failure(.forbidden)
            case 404:
                return .failure(.notFound)
            case 405:
                return .failure(.methodNotAllowed)
            case 409:
                return .failure(.conflict)
            case 422:
                return .failure(.validationError)
            default:
                return .failure(.badResponse(statusCode: statusCode))
            }
        }
        
        guard let data = data else { return .failure(.invalidResponse) }
        
        if statusCode == 200 && data.isEmpty { return .failure(.noData) }
        return .success(data)
    }
}

extension URLResponse {
    
    var httpStatusCode: Int? {
        
        guard let httpResponse = self as? HTTPURLResponse else {
            return nil
        }
        return httpResponse.statusCode
    }
}
