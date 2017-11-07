//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 6/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell
{
    override var datasourceItem: Any?
    {
        didSet
        {
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = "  \(tweet.user.username)\n"
            
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4.0
            
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
            
            //messageTextView.text = tweet.message
        }
    }
    
    let messageTextView : UITextView =
    {
        let tv = UITextView()
        tv.text = "SOME SAMPLE TEXT"
        tv.backgroundColor = .clear
        
        return tv
    }()
    
    let profileImageView : UIImageView =
    {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ProfilePicture")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let replyButton : UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Reply").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let retweetButton : UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let likeButton : UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Like").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let directMessageButton : UIButton =
    {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "SendMessage").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    override func setupViews()
    {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230.0, g: 230.0, b: 230.0)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        //addSubview(replyButton)
        //addSubview(retweetButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12.0, leftConstant: 12.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 50.0, heightConstant: 50.0)
        
        messageTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4.0, leftConstant: 4.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 0.0)
        
        //replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 20.0, heightConstant: 20.0)
        
        setupBottomButtoms()
    }
    
    fileprivate func setupBottomButtoms()
    {
        let replyButtonContainerView = UIView()
        
        let retweetButtonContainerView = UIView()
        
        let likeButtonContainerView = UIView()
        
        let directMessageButtonContainerView = UIView()
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView,
                                                            retweetButtonContainerView,
                                                            likeButtonContainerView,
                                                            directMessageButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 4.0, rightConstant: 0.0, widthConstant: 0.0, heightConstant: 20.0)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: replyButtonContainerView.bottomAnchor, right: nil, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 20.0, heightConstant: 0.0)
        
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: retweetButtonContainerView.bottomAnchor, right: nil, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 20.0, heightConstant: 0.0)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: likeButtonContainerView.bottomAnchor, right: nil, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 20.0, heightConstant: 0.0)
        
        directMessageButton.anchor(directMessageButtonContainerView.topAnchor, left: directMessageButtonContainerView.leftAnchor, bottom: directMessageButtonContainerView.bottomAnchor, right: nil, topConstant: 0.0, leftConstant: 0.0, bottomConstant: 0.0, rightConstant: 0.0, widthConstant: 20.0, heightConstant: 0.0)
    }
}
