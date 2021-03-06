//
//  MainInteractor.swift
//  
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainBusinessLogic {
    func doSomething(request: Main.Something.Request)
    func loadRepo(request: Main.Repo.Request)
    var item: Item? {get set }
}

protocol MainDataStore {
    var item: Item? {get set}
}

class MainInteractor: MainBusinessLogic, MainDataStore {

    var item: Item?

    var presenter: MainPresentationLogic?
    var worker: MainWorker?

    // MARK: Do something

    func doSomething(request: Main.Something.Request) {
        worker = MainWorker()

        worker?.getItems(completion: { (result) in
            let response = Main.Something.Response(item: result!)
            self.presenter?.presentSomething(response: response)
        })

    }

    func loadRepo(request: Main.Repo.Request) {
        let itemRequest = request.item
        item = itemRequest
        let response = Main.Repo.Response(item: item!)
        presenter?.presentRepo(response: response)
    }
}
