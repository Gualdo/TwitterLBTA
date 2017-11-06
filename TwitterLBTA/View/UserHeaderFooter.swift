//
//  Cells.swift
//  TwitterLBTA
//
//  Created by Eduardo David De La Cruz Marrero on 4/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents

// MARK: - Global Variables (Twitter Color)

let twitterBlue = UIColor(r: 61.0, g: 167.0, b: 244.0)

// MARK: - UserFooter (DatasourceCell) Class

class UserFooter: DatasourceCell
{
    let textLabel : UILabel =
    {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = twitterBlue
        
        return label
    }()
    
    override func setupViews()
    {
        super.setupViews()
        
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        
        addSubview(whiteBackgroundView)
        addSubview(textLabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 14.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 0.0)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0.0, leftConstant: 12.0, bottomConstant: 14.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 0.0)
    }
}

// MARK: - UserHeader (DatasourceCell) Class

class UserHeader: DatasourceCell
{
    let textLabel : UILabel =
    {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    override func setupViews()
    {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230.0, g: 230.0, b: 230.0)
        
        addSubview(textLabel)
        
        //textLabel.fillSuperview() // Fill the entire header
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0.0, leftConstant: 12.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 0.0)
    }
}
