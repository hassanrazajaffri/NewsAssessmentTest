//
//  NewsListViewModelTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
import CoreData
@testable import HararooAssesment

class NewsListViewModelTests: XCTestCase {
    
    var newsListViewModel: NewsListViewModel!
    var mockAPIController: MockAPIController!
    
    override func setUp() {
        super.setUp()
      
        mockAPIController = MockAPIController()
        newsListViewModel = NewsListViewModel(apiController: mockAPIController)
        newsListViewModel.fetchNewsFromAPI(){ (result,error) in
            
            
        }
    }
    
    override func tearDown() {
        newsListViewModel = nil
        mockAPIController = nil
        super.tearDown()
    }
    
    func test_successNewsResponse_generatesNewsModels() {
        // Since we are returning 3 APINews objects in mockAPIController inside the NewsListViewModel
        XCTAssertEqual(newsListViewModel.newsViewModels.count, 3)
    }
}

