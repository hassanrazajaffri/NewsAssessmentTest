//
//  UIImageVieweExtensions.swift
//  HararooAssesment
//
//  Created by Hassan Aslam on 09/03/2022.
//
import Foundation
import UIKit
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        if url.absoluteString == "" , url.absoluteString.contains("noimage") {
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(named: "Noimage")
            }
        }
        else{
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
        }
    }
    func downloaded(from link: String = "", contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
