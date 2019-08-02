//
//  MainWorker.swift
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

class MainWorker
{
    
    let api = APIRequest()
    func doSomeWork()
    {
    }
    
    func getItems(completion: @escaping([Item]?) -> Void){
        
        api.open(url: Constants.base_url) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
    }
}
