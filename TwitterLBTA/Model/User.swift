//
//  User.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 6/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User : JSONDecodable
{
    let name : String
    let username : String
    let bioText : String
    let profileImageUrl : String
    
    init(json: JSON)
    {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
