//
//  Item.swift
//  
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

struct ItemRoot: Codable{
    let items: [Item]
}

struct Item: Codable{
    let name: String
    let owner: Owner
    let stargazers_count: Int
}

struct Owner: Codable{
    let login: String
    let avatar_url: String
}
