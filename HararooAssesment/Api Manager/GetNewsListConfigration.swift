//
//  GetNewsListConfigration.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation

struct GetNewsListConfigration: WebServiceConfiguration {
    typealias Response = Data
    var method: HTTPMethod { return .get }
    var requestBody: Data? {
        return nil
    }
}
struct MostViewedNewsResponse: Codable {
    let num_results: Int
    let results: [ApiNews]
    let status :String
    enum CodingKeys: String, CodingKey {
        case num_results, results,status
        
    }
}

struct ApiNews: Codable {
    let id: Double
    let asset_id: Double
    let name: String?
    let uri: String?
    let url: String?
    let source: String?
    let published_date: String?
    let updated: String?
    let title: String?
    let subsection: String?
    let section: String?
    let nytdsection: String?
    let adx_keywords: String?
    let column: String?
    let byline: String?
    let type: String?
    let abstract: String?
    let eta_id: Int?
    let des_facet : [String]
    let org_facet : [String]
    let per_facet : [String]
    let geo_facet : [String]
    let media : [Media]
    
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case asset_id
        case name
        case uri
        case url
        case source
        case published_date
        case updated
        case title
        case subsection
        case section
        case nytdsection
        case adx_keywords
        case column
        case byline
        case type
        case abstract
        case eta_id
        case des_facet
        case org_facet
        case per_facet
        case geo_facet
        case media
        
    }
}
struct Media: Codable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approved_for_syndication: Int?
    let media_metadata : [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case approved_for_syndication
        case media_metadata = "media-metadata"
    }
}
struct MediaMetadata: Codable {
    
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
    
    enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
        
    }
}
