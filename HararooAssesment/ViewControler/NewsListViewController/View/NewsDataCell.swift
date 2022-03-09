//
//  NewsDataCell.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import Foundation
import UIKit
class NewsDataCell: UITableViewCell {
    
    @IBOutlet weak var newsThumbnail: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var auttherName: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var year: UILabel!
    override open func awakeFromNib() {
        super.awakeFromNib()
        newsTitle.font = Font.semiBold.withSize(18)
        auttherName.font = Font.regular.withSize(16)
        newsDate.font = Font.regular.withSize(16)
    }
    func configure(news : NewsViewModel){
        self.newsTitle.text = news.getTitle()
        self.newsDate.text = news.getPublishedDate()
        self.auttherName.text = news.getByline()
       if let mediaUrl =  news.getMediaUrl(){
        self.newsThumbnail.downloaded(from:mediaUrl)
        }
        else{
        self.newsThumbnail.image = UIImage(named: "Noimage")
        }
    }
    override open var isSelected: Bool {
        willSet {
        }
    }
}
extension NewsDataCell{
    class var id : String{
        return String(describing: self)
    }
    class var identifier: String{
        return String(describing: self)
    }
    class var nib: UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}


