//
//  NewsListViewControllerTests.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import XCTest
import CoreData
@testable import HararooAssesment

class NewsListViewControllerTests: XCTestCase {

    var sut: NewsListViewController!
    var window: UIWindow!
    var navigationController: UINavigationController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard.MAIN
        guard let vc = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as? NewsListViewController else {
            return XCTFail("Could not instantiate NewsListViewController from main storyboard")
        }
        sut = vc
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

    func test_newsListViewController_hasATableView() {
        XCTAssertNotNil(sut.newsListTable)
    }
    
    func test_tableView_hasDelegate() {
        XCTAssertNotNil(sut.newsListTable.delegate)
    }
    
    func test_tableView_confromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.newsListTable.delegate!.responds(to: #selector(sut.newsListTable.delegate?.tableView(_:didSelectRowAt:))))
    }
    
    func test_tableView_hasDataSource() {
        XCTAssertNotNil(sut.newsListTable.dataSource)
    }
    func test_tableView_hasNewsDataCell() {
        let cell =  UINib(nibName: "NewsDataCell", bundle: nil)

        XCTAssertNotNil(cell)
    }
    func test_tableView_hasNewsDataCell_hasIdentifire() {
        XCTAssertNotNil(NewsDataCell.id)
    }
    func test_tableView_conformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.newsListTable.delegate!.responds(to: #selector(sut.newsListTable.dataSource!.numberOfSections(in:))))
        XCTAssertTrue(sut.newsListTable.delegate!.responds(to: #selector(sut.newsListTable.dataSource!.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.newsListTable.delegate!.responds(to: #selector(sut.newsListTable.dataSource!.tableView(_:cellForRowAt:))))
    }
    
}

extension XCTestCase{
    
    func waitToShow(_ element: XCUIElement){
        let exists = NSPredicate(format: "exists == true")
        let hideExpectation = expectation(for: exists, evaluatedWith: element, handler: nil)
        XCTWaiter().wait(for: [hideExpectation], timeout: 5)
    }
}
