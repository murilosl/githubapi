//
//  MainView.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit
import SnapKit

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
        
        tableView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading)
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }

}
