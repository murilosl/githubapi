//
//  UIView.swift
//  Clean Swift Template Project
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit


extension UIView{
    
    func add(_ view: UIView){
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
