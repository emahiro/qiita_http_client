//
//  User.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

struct User: JSONDecodable {
    
    let id: String
    let name: String
    let profileImageUrl: URL
    
    init(json: Any) throws {
        guard let dict = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let id = dict["id"] as? String else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dict["id"])
        }
        
        guard let name = dict["name"] as? String else {
            throw JSONDecodeError.missingValue(key: "name", actualValue: dict["name"])
        }
        
        guard let profileImageUrlStr = dict["profile_image_url"] as? String else {
            throw JSONDecodeError.missingValue(key: "profile_image_url", actualValue: dict["profile_image_url"])
        }
        
        self.id = id
        self.name = name
        self.profileImageUrl = URL(string: profileImageUrlStr)!
    }
}
