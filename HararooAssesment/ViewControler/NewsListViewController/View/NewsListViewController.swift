//
//  NewsListViewController.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation
import UIKit

class NewsListViewController : UIViewController {
    
    @IBOutlet weak var activityView: UIView!
    private var newsApiController: NewsAPIController!
    @IBOutlet weak var newsListTable: UITableView!
    @IBOutlet weak var activittyIndicator: UIActivityIndicatorView!
    private var newsListViewModel: NewsListViewModel!
    private var displayMessage = "No Data available"
    var newsViewModels :[NewsViewModel] = [NewsViewModel]()
    lazy var refresh: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        //   refreshControl.tintColor = UIColor.lightText
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsApiController = NewsAPIController()
        self.newsListTable.register(UINib(nibName: "NewsDataCell", bundle: nil), forCellReuseIdentifier: NewsDataCell.identifier)
        setupUI()
        setupViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    private func setupUI(){
        
        self.newsListTable.delegate = self
        self.newsListTable.dataSource = self
        self.newsListTable.addSubview(refresh)
        self.newsListTable.rowHeight = UITableView.automaticDimension;
        self.newsListTable.estimatedRowHeight = 44.0;
        self.navigationController?.navigationBar.barTintColor = UIColor.navigationBarBackgroundColor
        self.navigationController?.navigationBar.tintColor = UIColor.navigationBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navigationBarTextColor]
        self.view.backgroundColor = UIColor.navigationBarBackgroundColor
    }
    
    private func setupViewModel() {
        activityView.isHidden = false
        activittyIndicator.startAnimating()
        self.newsListViewModel = NewsListViewModel(apiController: newsApiController)
        self.newsListViewModel.fetchNewsFromAPI(){[weak self] (result,error) in
            self?.activittyIndicator.stopAnimating()
            self?.activityView.isHidden = true
            if error == nil{
                self?.newsViewModels = result ?? [NewsViewModel]()
                self?.newsListTable.reloadData()
            }
            else{
                self?.showAlart(message: error!.errorDescription)
            }
            
        }
        
    }
    
    private func showAlart(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        self.newsListViewModel = NewsListViewModel(apiController: newsApiController)
        self.newsListViewModel.fetchNewsFromAPI{[unowned self] (result,error) in
            if refresh.isRefreshing{
                refresh.endRefreshing()
            }
            if error == nil{
                newsViewModels = result ?? [NewsViewModel]()
                self.newsListTable.reloadData()
            }
            else{
                self.showAlart(message: error!.errorDescription)
            }
        }
    }
}

extension NewsListViewController:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.newsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsDataCell.identifier, for: indexPath) as? NewsDataCell else { return UITableViewCell() }
        cell.configure(news: self.newsViewModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if  let vc  = NewsDetailsViewController.storyBoardInstance(){
            vc.newsDetailsObj = self.newsViewModels[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
