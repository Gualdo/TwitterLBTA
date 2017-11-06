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
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any?
    {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int
    {
        return users.count
    }
}
