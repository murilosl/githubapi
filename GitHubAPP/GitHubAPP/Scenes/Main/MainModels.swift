//
//  MainModels.swift
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

enum Main {
    // MARK: Use cases

    enum Something {
        struct Request {
        }
        struct Response {
            let item: [Item]
        }
        struct ViewModel {
            let item: [Item]
        }
    }

    enum Repo {
        struct Request {
            let item: Item
        }

        struct Response {
            let item: Item
        }

        struct ViewModel {
            let item: Item
        }
    }
}
