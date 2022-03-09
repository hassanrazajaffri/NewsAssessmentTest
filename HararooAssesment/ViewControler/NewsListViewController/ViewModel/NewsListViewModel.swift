//
//  NewsListViewModel.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation

class NewsListViewModel : NSObject {
    
    @objc dynamic var newsViewModels :[NewsViewModel] = [NewsViewModel]()
    private var token :NSKeyValueObservation?
    private var apiController : NewsAPIController
    
    var bindToSourceViewModels: (() -> ()) = {  }
    var showMessageClosure: (() -> ()) = {}
    var updateLoadingStatus: (() -> ()) = {}
    
    init(apiController: NewsAPIController) {
        self.apiController = apiController
        super.init()
        
        token = self.observe(\.newsViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
    }
    var displayMessage: String? {
        didSet {
            self.showMessageClosure()
        }
    }
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus()
        }
    }
    func invalidateObservers() {
        self.token?.invalidate()
    }
    func fetchNewsFromAPI(completion: @escaping([NewsViewModel]?, _ error: Error?) -> Void){
        isLoading = true
        self.apiController.getNewsApi() { [unowned self] (newsArray, error) in
            self.isLoading = false
            if let news = newsArray{
                self.newsViewModels = self.getNewsVM(newsArray: news)
                completion(self.getNewsVM(newsArray: news),nil)
            }else{
                self.displayMessage = error?.errorDescription
                completion(nil,error)
            }
        }
    }
    func getNewsVM(newsArray:[ApiNews]) ->  [NewsViewModel] {
        var newArray = [NewsViewModel]()
        for item in newsArray {
            let news = NewsViewModel.init(news: item)
            newArray.append(news)
        }
        return newArray
    }
    func news(at index:Int) -> NewsViewModel {
        return self.newsViewModels[index]
    }
}
