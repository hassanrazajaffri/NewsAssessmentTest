//
//  UIFontUtilities.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//

import UIKit

let lightFontName                               = "Avenir-Light"
let regularFontName                             = "Avenir-Book"
let semiBoldFontName                            = "Avenir-Roman"
let boldFontName                                = "Avenir-Heavy"
let heavyFontName                               = "Avenir-Black"
enum Font {
    
    case light
    case regular
    case semiBold
    case bold
    case heavy
    
    func withSize(_ size: CGFloat) -> UIFont {
        
        switch self {
        case .light:
            return UIFont(name: lightFontName, size: size)!
        case .regular:
            return UIFont(name: regularFontName, size: size)!
        case .semiBold:
            return UIFont(name: semiBoldFontName, size: size)!
        case .bold:
            return UIFont(name: boldFontName, size: size)!
        case .heavy:
            return UIFont(name: heavyFontName, size: size)!
        }
    }
}
