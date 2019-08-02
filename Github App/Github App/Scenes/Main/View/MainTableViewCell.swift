//
//  MainTableViewCell.swift
//  Clean Swift Template Project
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let idCell = "cellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
