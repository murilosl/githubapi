//
//  RepoInteractor.swift
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

protocol RepoBusinessLogic {
    func doSomething(request: Repo.Something.Request)
}

protocol RepoDataStore {
    var item: Item? { get set }
}

class RepoInteractor: RepoBusinessLogic, RepoDataStore {
    var item: Item?

    var presenter: RepoPresentationLogic?
    var worker: RepoWorker?
    //var name: String = ""

    // MARK: Do something

    func doSomething(request: Repo.Something.Request) {
        worker = RepoWorker()
        worker?.doSomeWork()

        let response = Repo.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
