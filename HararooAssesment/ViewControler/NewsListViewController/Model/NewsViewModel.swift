//
//  NewsViewModel.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation

class NewsMedia : NSObject {
    
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approved_for_syndication: Int?
    var media_metadata : [NewsMediaMetadata]
    
    init(media:Media) {
        self.type =  media.type ?? ""
        self.subtype =  media.subtype ?? ""
        self.caption =  media.caption ?? ""
        self.copyright =  media.copyright ?? ""
        self.approved_for_syndication =  media.approved_for_syndication
        self.media_metadata = [NewsMediaMetadata]()
        for item in media.media_metadata {
            let newsMedia = NewsMediaMetadata.init(media: item)
            self.media_metadata.append(newsMedia)
        }
    }
}
class NewsMediaMetadata : NSObject {
    
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
    
    init(media:MediaMetadata) {
        self.url =  media.url ?? ""
        self.format =  media.format ?? ""
        self.height =  media.height
        self.width =  media.width
    }
}
