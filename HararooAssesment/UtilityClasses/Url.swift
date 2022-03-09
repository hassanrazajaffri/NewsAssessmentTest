//
//  Url.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation
enum SERVER_MODE
{
    case development
    case production
};

var mode : SERVER_MODE = SERVER_MODE.development

let BASE_URL_PRODUCTION:String = "https://api.nytimes.com/svc/"
let BASE_URL_DEVELOPMENT:String = "https://api.nytimes.com/svc/"


let ApiType:String = "mostpopular/"
let version:String = "v2/"
let getCategory:String = "mostviewed/"
let section:String = "all-sections/"
let period:String = "7.json?"
let apiKey:String = "api-key="
let myAccountApiKey = "DUz0r0I7jRKjAB0uEAPmEweElc4S9BiC"

struct Constants {
    struct Server {
        static let baseURL = BASE_URL_DEVELOPMENT
        static let  getAllMostViewedNews = baseURL + ApiType + version + getCategory + section + period + apiKey + myAccountApiKey
        
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] 
        static let Tmp = NSTemporaryDirectory()
    }
}


