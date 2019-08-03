//
//  APIRequest.swift
//  
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation
import Alamofire

typealias APIResultTypeAlias = ([Item]?) -> Void

class APIRequest {

    func open(url: String, completion: @escaping APIResultTypeAlias) {

         Alamofire.request(url).responseData { (result) in
            if let dataReturn = result.value {

                do {
                    let json = JSONDecoder()
                    let itemsParse = try json.decode(ItemRoot.self, from: dataReturn)

                    completion(itemsParse.items)
                } catch {

                }
            } else {

            }
        }
    }
}
