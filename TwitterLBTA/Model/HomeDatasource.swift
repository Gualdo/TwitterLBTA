//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Eduardo David De La Cruz Marrero on 4/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

// MARK: - HomeDatasource (Datasource) Class

class HomeDatasource: Datasource, JSONDecodable
{
    // MARK: - Global Variables
    
    let users : [User]
    let tweets : [Tweet]
    
    // MARK: - Users and tweet Init
    
    required init(json: JSON) throws
    {
        let usersJsonArray = json["users"].array
        
        self.users = (usersJsonArray!.map{ User(json: $0) })
        
        let tweetsJsonArray = json["tweets"].array
        
        self.tweets = tweetsJsonArray!.map{ Tweet(json: $0) }
    }
    
    // MARK: - Footer Class override
    
    override func footerClasses() -> [DatasourceCell.Type]?
    {
        return [UserFooter.self]
    }
    
    // MARK: - Header Class override
    
    override func headerClasses() -> [DatasourceCell.Type]?
    {
        return [UserHeader.self]
    }
    
    // MARK: - Cell Class override
    
    override func cellClasses() -> [DatasourceCell.Type]
    {
        return [UserCell.self, TweetCell.self]
    }
    
    // MARK: - Item at indexPath
    
    override func item(_ indexPath: IndexPath) -> Any?
    {
        if indexPath.section == 1
        {
            return tweets[indexPath.item]
        }
        
        return users[indexPath.item]
    }
    
    // MARK: - Number of sections
    
    override func numberOfSections() -> Int
    {
        return 2
    }
    
    // MARK: - Numer of items in section
    
    override func numberOfItems(_ section: Int) -> Int
    {
        if section == 1
        {
            return tweets.count
        }
        return users.count
    }
}
