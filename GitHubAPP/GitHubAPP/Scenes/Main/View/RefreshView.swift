//
//  RefreshView.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 03/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class RefreshView: UIView{
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect.zero)
        imageView.image = UIImage.gif(name: "load")
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        add(imageView)
    }
}
