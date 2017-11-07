//
//  Service.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 7/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service
{
    // MARK: - Global variables
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedIstance = Service()
    
    // MARK: - JSONError Class
    
    class JSONError : JSONDecodable
    {
        required init(json: JSON) throws
        {
            print("JSON ERROR")
        }
    }
    
    // MARK: - JSON Request
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ())
    {
        // Start our JSON Fetch here
        // First ? Class type for success on network request, second ? failure error response
        //let request : APIRequest<?, ?> = tron.request("")
        let request : APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: ({ (homeDatasource) in
            
            completion(homeDatasource)
            
        })) { (err) in
            print("Failed to fetch json...", err)
        }
    }
}
