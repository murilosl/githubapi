//
//  RepoView.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 03/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit
import SnapKit

class RepoView: UIView {

    let nameLabel: UILabel
    let fullNameLabel: UILabel
    let imageAuthor: UIImageView
    let starButton: UIButton

    override init(frame: CGRect) {
        nameLabel = UILabel()
        fullNameLabel = UILabel()
        imageAuthor = UIImageView()
        starButton = UIButton()

        super.init(frame: frame)

        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func populate(item: Item) {
        nameLabel.text = item.owner.login
        fullNameLabel.text = item.full_name
        imageAuthor.load(url: item.owner.avatar_url)

        let star = "★ \(item.stargazers_count)"
        starButton.setTitle(star, for: .normal)

        setupUI()
        setupConstraints()
    }

    func setupUI() {
        add(nameLabel)
        add(fullNameLabel)
        add(imageAuthor)
        add(starButton)

        nameLabel.numberOfLines = 0
        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        nameLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        nameLabel.textColor = .gray

        fullNameLabel.numberOfLines = 0
        fullNameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        fullNameLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        fullNameLabel.textColor = .blue

        starButton.setTitleColor(.black, for: .normal)
        starButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)

        imageAuthor.configureUI()
    }

    func setupConstraints() {
    
        
        imageAuthor.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        fullNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageAuthor.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
        }
        
        starButton.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
        }
    }

}
