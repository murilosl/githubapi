//
//  RepoView.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 03/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class RepoView: UIView {

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: leadingAnchor),
            topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

}
