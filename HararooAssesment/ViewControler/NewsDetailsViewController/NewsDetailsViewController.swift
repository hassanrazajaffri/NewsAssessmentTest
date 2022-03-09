//
//  NewsDetailsViewController.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation
import UIKit

class NewsDetailsViewController : UIViewController {
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var newDetailsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDetails: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsPublisher: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    var newsDetailsObj :NewsViewModel =  NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateData()
    }
    
    private func setupUI(){
        self.navigationController?.navigationBar.isHidden = true
        let image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(image, for: .normal)
        backButton.tintColor = UIColor.navigationBarTextColor
        newDetailsTitle.textColor = UIColor.navigationBarTextColor
        topBar.backgroundColor = UIColor.navigationBarBackgroundColor
    }
    private func populateData ()
    {
        self.newsTitle.text = newsDetailsObj.getTitle()
        self.newsDetails.text = newsDetailsObj.getDetails()
        self.newsDate.text = newsDetailsObj.getPublishedDate()
        self.newsPublisher.text = newsDetailsObj.getByline()
        if let mediaUrl =  newsDetailsObj.getMediaUrl(){
            self.newsImage.downloaded(from:mediaUrl)
        }
        else{
            self.newsImage.image = UIImage(named: "Noimage")
        }
        
    }
    static func storyBoardInstance() -> NewsDetailsViewController?{
        let st = UIStoryboard.MAIN
        return st.instantiateViewController(withIdentifier: NewsDetailsViewController.id) as? NewsDetailsViewController
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
}


