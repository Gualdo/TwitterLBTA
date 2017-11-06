//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Eduardo David De La Cruz Marrero on 4/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents

// MARK: - HomeDatasource (Datasource) Class

class HomeDatasource: Datasource
{
    let users : [User] =
    {
        let gualdoUser = User(name: "Eduardo De La Cruz", username: "@gualdillo", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "ProfilePicture"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "RayWnderlich"))
        
        let kindleCourseUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "This recently course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView an UICollectionView. This course also teaches some basics on the Swift languaje, for example If Statements and For Loops. This will be an excelent purchase for you.", profileImage: #imageLiteral(resourceName: "ProfilePicture"))
        
        return [gualdoUser, rayUser, kindleCourseUser]
    }()
    
    let tweets : [Tweet] =
    {
        let gualdoUser = User(name: "Eduardo De La Cruz", username: "@gualdillo", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "ProfilePicture"))
        let tweet = Tweet(user: gualdoUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are ejoying the series so far. I really really need a long text block to render out so we´re going to stop here.")
        let tweet2 = Tweet(user: gualdoUser, message: "This is the second tweet message for our sample project. Very very exciting message.....")
        
        return[tweet, tweet2]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]?
    {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]?
    {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type]
    {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any?
    {
        if indexPath.section == 1
        {
            return tweets[indexPath.item]
        }
        
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int
    {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int
    {
        if section == 1
        {
            return tweets.count
        }
        return users.count
    }
}
