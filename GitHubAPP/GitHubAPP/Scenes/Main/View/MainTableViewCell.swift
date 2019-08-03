//
//  MainTableViewCell.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let idCell = "cellId"

    // MARK: - Objects
    let nameLabel: UILabel
    let fullNameLabel: UILabel
    let imageAuthor: UIImageView
    let starButton: UIButton

    // MARK: - Override Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        nameLabel = UILabel()
        fullNameLabel = UILabel()
        imageAuthor = UIImageView()
        starButton = UIButton()

        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Populate

    func populate(item: Item) {
        nameLabel.text = item.owner.login
        fullNameLabel.text = item.full_name
        imageAuthor.load(url: item.owner.avatar_url)

        starButton.setTitle((String(item.stargazers_count)), for: .normal)

        setupUI()
        setupConstraints()
    }

    // MARK: - Setup UI
    
    func setupUI() {
        contentView.add(nameLabel)
        contentView.add(fullNameLabel)
        contentView.add(imageAuthor)
        contentView.add(starButton)

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

    // MARK: - Setup Constraints
    
    func setupConstraints() {

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0(40)]-8-[v1(140)]-8-[v2(80)]-8-[v3(80)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageAuthor, "v1": fullNameLabel, "v2": nameLabel, "v3": starButton]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageAuthor]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1": fullNameLabel]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v2": nameLabel]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v3": starButton]))

        imageAuthor.translatesAutoresizingMaskIntoConstraints = false
        imageAuthor.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imageAuthor.widthAnchor.constraint(equalToConstant: 15).isActive = true

    }
    
}
