//
//  UIImageView.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let url_from = URL(string: url) {
                if let data = try? Data(contentsOf: url_from) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
            
        }
    }
    
    func configureUI(){
        let color = UIColor(displayP3Red: 244, green: 242, blue: 240, alpha: 0)
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}
