//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 6/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet
{
    let user: User
    let message: String
    
    init(json : JSON)
    {
        let userJson = json["user"]
        
        self.user = User(json: userJson)        
        self.message = json["message"].stringValue
    }
}
