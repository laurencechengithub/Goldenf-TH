//
//  ThunderFireSportIndex.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/9/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import SwiftyJSON

//{
//    "code": 0,
//    "data": {
//        "url": "https://xj-mbs.prdasbbwla1.com/m/zh-cn/sports?theme=LH&sni=1wtxuaopschb5fbpasqvtlnx"
//    }
//}

struct ThunderFireSportIndex {
    var code:Int
    var data:SportIndexData
    
    init(fromJSON json:JSON) {
        self.code = json["code"].intValue
        self.data = SportIndexData(fromJSON: json["data"])
    }
    
}

struct SportIndexData {
    var url:String
    
    init(fromJSON json:JSON) {
        self.url = json["url"].stringValue
    }
}
