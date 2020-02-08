//
//  MainTableViewCell.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit
import SnapKit

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

        let star = "★ \(item.stargazers_count)"
        starButton.setTitle(star, for: .normal)

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
        
        contentView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(0)
        }
        
        imageAuthor.snp.makeConstraints { (make) in
            make.leading.equalTo(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        fullNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(imageAuthor.snp.trailing).offset(10)
            make.top.equalTo(10)
            make.width.equalTo(180)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(fullNameLabel.snp.trailing).offset(10)
            make.top.equalTo(10)
        }
        
        starButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(10)
        }

    }

}
