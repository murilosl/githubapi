//
//  RepoView.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 03/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

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

        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:[imageAuthorView]",
            options: [.alignAllCenterX],
            metrics: nil,
            views: ["imageAuthorView": imageAuthor]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v1(200)]-8-[v2(40)]-8-[v3(80)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageAuthor, "v1": fullNameLabel, "v2": nameLabel, "v3": starButton]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1": fullNameLabel]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v2": nameLabel]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v3": starButton]))

    }

}
