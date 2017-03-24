//
//  Tag.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

struct Tag: JSONDecodable {
    
    let name: String
    let versions: [String]
    
    init(json: Any) throws {
        guard let dict = json as? [AnyHashable: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let name = dict["name"] as? String else {
            throw JSONDecodeError.missingValue(key: "name", actualValue: dict["name"])
        }
        
        guard let versionObjs = dict["versions"] as? [Any] else {
            throw JSONDecodeError.missingValue(key: "versions", actualValue: dict["versions"])
        }
        
        self.name = name
        self.versions = versionObjs.map {
            return String(describing: $0)
        }
    }
}
