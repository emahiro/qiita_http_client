//
//  JSONDecodable.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}
