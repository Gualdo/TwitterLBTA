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
//            nameLabel.text = datasourceItem as? String
        }
    }
    
    let profileImageView : UIImageView =
    {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ProfilePicture")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel : UILabel =
    {
        let label = UILabel()
        label.text = "Eduardo De La Cruz"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        return label
    }()
    
    let userNameLabel : UILabel =
    {
        let label = UILabel()
        label.text = "@gualdillo"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor(r: 130.0, g: 130.0, b: 130.0)
        
        return label
    }()
    
    let bioTextView : UITextView =
    {
        let textView = UITextView()
        textView.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!"
        textView.font = UIFont.systemFont(ofSize: 15)
        
        return textView
    }()
    
    let followButton : UIButton =
    {
        let twitterBlue = UIColor(r: 61.0, g: 167.0, b: 244.0)
        let button = UIButton()
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        
        return button
    }()
    
    override func setupViews()
    {
        super.setupViews()
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12.0, leftConstant: 12.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 50.0, heightConstant: 50.0)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0.0, leftConstant: 8.0, bottomConstant: 0.0, rightConstant: 12.0, widthConstant: 0.0, heightConstant: 20.0)
        
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 24.0)
        
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4.0, leftConstant: -4.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 0.0)
        
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 12.0, widthConstant: 120, heightConstant: 34)
    }
}
