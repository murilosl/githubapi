//
//  RepoPresenter.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 03/08/19.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RepoPresentationLogic {
    func presentSomething(response: Repo.Something.Response)
}

class RepoPresenter: RepoPresentationLogic {
    weak var viewController: RepoDisplayLogic?

    // MARK: Do something

    func presentSomething(response: Repo.Something.Response) {
        let viewModel = Repo.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
