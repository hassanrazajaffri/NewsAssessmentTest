//
//  MockAPIController.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation
@testable import HararooAssesment

class MockAPIController: NewsAPIController {
    
    override func getNewsApi( completion: @escaping (_ response: [ApiNews]?, _ error: Error?) -> Void) {
        completion(getSampleNews(), nil)
    }
   
}
extension MockAPIController{
    func getSampleNews() -> [ApiNews] {
        var news: [ApiNews] = []
        news.append(ApiNews(id: 1, asset_id: 2, name: "test1", uri: "", url: "", source: "", published_date: "", updated: "", title: "Unit Test 1", subsection: "", section: "", nytdsection: "", adx_keywords: "", column: "", byline: "", type: "", abstract: "", eta_id: 0, des_facet: [String](), org_facet: [String](), per_facet: [String](), geo_facet: [String](), media: [Media]()))
        news.append(ApiNews(id: 2, asset_id: 2, name: "test1", uri: "", url: "", source: "", published_date: "", updated: "", title: "Unit Test 1", subsection: "", section: "", nytdsection: "", adx_keywords: "", column: "", byline: "", type: "", abstract: "", eta_id: 0, des_facet: [String](), org_facet: [String](), per_facet: [String](), geo_facet: [String](), media: [Media]()))
        news.append(ApiNews(id: 3, asset_id: 2, name: "test1", uri: "", url: "", source: "", published_date: "", updated: "", title: "Unit Test 1", subsection: "", section: "", nytdsection: "", adx_keywords: "", column: "", byline: "", type: "", abstract: "", eta_id: 0, des_facet: [String](), org_facet: [String](), per_facet: [String](), geo_facet: [String](), media: [Media]()))
        return news
    }
}
