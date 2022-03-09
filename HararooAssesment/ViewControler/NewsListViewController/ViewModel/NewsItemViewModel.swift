//
//  NewsItemViewModel.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation
class NewsViewModel : NSObject {
    
    private var id: Double
    private var asset_id: Double
    private var name: String?
    private var uri: String?
    private var url: String?
    private var source: String?
    private var published_date: String?
    private var updated: String?
    private var title: String?
    private var subsection: String?
    private var section: String?
    private var nytdsection: String?
    private var adx_keywords: String?
    private var column: String?
    private var byline: String?
    private var type: String?
    private var abstract: String?
    private var eta_id: Int?
    private var des_facet : [String]
    private var org_facet : [String]
    private var per_facet : [String]
    private var geo_facet : [String]
    private var media : [NewsMedia]
    
    func getName()->String{
        if let name = name {
            return name
        }
        return ""
    }
    func getTitle()->String{
        if let title = title {
            return title
        }
        return ""
    }
    func getDetails()->String{
        if let abstract = abstract {
            return abstract
        }
        return ""
    }
    func getPublishedDate()->String{
        if let published_date = published_date {
            return published_date
        }
        return ""
    }
    func getByline()->String{
        if let byline = byline {
            return byline
        }
        return ""
    }
    func getMediaUrl()-> String?{
        if self.media.count > 0 {
        if let newsMetaData =  self.media[0].media_metadata.last{
            return newsMetaData.url
        }
        }
       return nil
    }
    init(news:ApiNews) {
        self.title =  news.title ?? ""
        self.asset_id =  news.asset_id
        self.name =  news.name ?? ""
        self.uri =  news.uri ?? ""
        self.url =  news.url ?? ""
        self.source =  news.source ?? ""
        self.published_date =  news.published_date ?? ""
        self.updated =  news.updated ?? ""
        self.subsection =  news.subsection ?? ""
        self.section =  news.section ?? ""
        self.nytdsection =  news.nytdsection ?? ""
        self.adx_keywords =  news.adx_keywords ?? ""
        self.column =  news.column ?? ""
        self.id =  news.id
        self.byline =  news.byline ?? ""
        self.type =  news.type ?? ""
        self.abstract =  news.abstract ?? ""
        self.eta_id =  news.eta_id
        self.des_facet =  news.des_facet
        self.org_facet =  news.org_facet
        self.per_facet =  news.per_facet
        self.geo_facet =  news.geo_facet
        self.media = [NewsMedia]()
        for item in news.media {
            let newsMedia = NewsMedia.init(media: item)
            self.media.append(newsMedia)
        }
    }
    override init() {
        self.title =   ""
        self.asset_id =  0
        self.name =  ""
        self.uri =   ""
        self.url =   ""
        self.source =   ""
        self.published_date =  ""
        self.updated =   ""
        self.subsection =   ""
        self.section =   ""
        self.nytdsection =   ""
        self.adx_keywords =   ""
        self.column =   ""
        self.id =  0
        self.byline =   ""
        self.type =   ""
        self.abstract =   ""
        self.eta_id =  0
        self.des_facet =  [String]()
        self.org_facet =  [String]()
        self.per_facet = [String]()
        self.geo_facet =  [String]()
        self.media = [NewsMedia]()
    }
}
