//
//  Extensions.swift
//  TwitterLBTA
//
//  Created by Eduardo de la Cruz on 7/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON // Makes this extension to can be called only by collections containing JSON
{
    func decode<T: JSONDecodable>() throws -> [T]
    {
        return try map { try T(json: $0) }
    }
}
