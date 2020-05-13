//
//  ThunderFireSportIndex.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/9/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import SwiftyJSON

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
