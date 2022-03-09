//
//  StoryBoard.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import UIKit
import Foundation
struct StoryBoard{
    static let MAIN = "Main"
 
}

extension UIStoryboard{
    static let MAIN = UIStoryboard(name: StoryBoard.MAIN, bundle: nil)
}
extension UIViewController{
    class var id : String{
        return String(describing: self)
    }
}


