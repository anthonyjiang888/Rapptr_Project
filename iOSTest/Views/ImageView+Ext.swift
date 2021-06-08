//
//  TextFieldPadding.swift
//  iOSTest
//
//  Created by Anthony on 6/7/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func loadImage(url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
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

    func loadImage(link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        loadImage(url: url, contentMode: mode)
    }
}
