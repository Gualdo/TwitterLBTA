//
//  Cells.swift
//  TwitterLBTA
//
//  Created by Eduardo David De La Cruz Marrero on 4/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents

// MARK: - UserFooter (DatasourceCell) Class

class UserFooter: DatasourceCell
{
    override func setupViews()
    {
        super.setupViews()
        
        backgroundColor = .green
    }
}

// MARK: - UserHeader (DatasourceCell) Class

class UserHeader: DatasourceCell
{
    override func setupViews()
    {
        super.setupViews()
        
        backgroundColor = .blue
    }
}

// MARK: - UserCell (DataSourceCell) Class

class UserCell: DatasourceCell
{
    override var datasourceItem: Any?
        {
        didSet
        {
            nameLabel.text = datasourceItem as? String
        }
    }
    
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
