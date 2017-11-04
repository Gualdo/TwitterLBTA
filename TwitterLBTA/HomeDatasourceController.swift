//
//  HomeDatasourceController.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 3/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell
{
    let nameLabel : UILabel =
    {
        let label = UILabel()
        label.text = "TEST TEST TEST"
        
        return label
    }()
    
    override func setupViews()
    {
        super.setupViews()
        
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 0.0)
    }
}

class HomeDatasource: Datasource
{
    let words = ["user1", "user2", "user3"]
    
    override func cellClasses() -> [DatasourceCell.Type]
    {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any?
    {
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int
    {
        return words.count
    }
}

class HomeDatasourceController: DatasourceController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
}
