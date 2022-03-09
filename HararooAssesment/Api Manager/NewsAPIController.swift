//
//  NewsAPIController.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation

class NewsAPIController {
    
    func getNewsApi(completion: @escaping (_ response: [ApiNews]?, _ error: Error?) -> Void) {
        
        GetNewsListConfigration().start { (response) in
            switch response {
            case let .success(response):
                do {
                    let responseObj = try JSONDecoder().decode(MostViewedNewsResponse.self, from: response!)
                    completion(responseObj.results, nil)
                } catch let error {
                    print("JSON Error \(error)")
                    completion(nil, WebServiceError.invalidResponse)
                }
            case let .failure(error):
                print("getMostViewedNews API Failed : \(error)")
                completion(nil, error)
            }
        }
    }
}
