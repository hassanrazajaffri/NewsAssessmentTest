//
//  NewsDetailsViewControllerTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
import CoreData
@testable import HararooAssesment

class NewsDetailsViewControllerTests: XCTestCase {

    var sut: NewsDetailsViewController!
    var window: UIWindow!
    var navigationController: UINavigationController!

    override func setUp() {
        super.setUp()
        
        guard let vc = NewsDetailsViewController.storyBoardInstance() else {
            return XCTFail("Could not instantiate NewsDetailsViewControllerTests from main storyboard")
        }
        sut = vc
        sut.newsDetailsObj = NewsViewModel()
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
        window = UIWindow()
        window.rootViewController = sut
        window.makeKeyAndVisible()
    }

    override func tearDown() {
        sut = nil
        window = nil
        navigationController = nil
        super.tearDown()
    }

    func test_newsDetailsViewController_hasAnewsTitle() {
        XCTAssertNotNil(sut.newsTitle)
    }
    func test_newsDetailsViewController_hasAnewDetailsTitle() {
        XCTAssertNotNil(sut.newDetailsTitle)
    }
    func test_newsDetailsViewController_hasAbackButton() {
        XCTAssertNotNil(sut.backButton)
    }
    func test_newsDetailsViewController_hasANewsDate() {
        XCTAssertNotNil(sut.newsDate)
    }
    func test_newsDetailsViewController_hasANewsObject() {
        XCTAssertNotNil(sut.newsDetailsObj)
    }
    func test_newsDetailsViewController_hasAPublisher() {
        XCTAssertNotNil(sut.newsPublisher)
    }
    func test_newsDetailsViewController_hasAImage() {
        XCTAssertNotNil(sut.newsImage)
    }
    func test_newsDetailsViewController_hasAnoImageFromDownload() {
        sut.newsImage.downloaded(from: URL(string: "https://www.noimage")!)
        XCTAssertNotNil(sut.newsImage.image)
    }
    func test_newsDetailsViewController_hasAImageFromDownload() {
        sut.newsImage.downloaded(from: URL(string: "https://www.myimage")!, contentMode: .scaleAspectFit)
        XCTAssertNotNil(sut.newsImage.image)
    }
}

