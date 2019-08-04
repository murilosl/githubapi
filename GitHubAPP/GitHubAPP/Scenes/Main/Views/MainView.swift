//
//  MainView.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class MainView: UIView {

    let tableView: UITableView

    override init(frame: CGRect) {
        tableView = UITableView()

        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        add(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

}
