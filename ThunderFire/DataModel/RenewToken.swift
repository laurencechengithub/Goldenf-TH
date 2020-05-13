//
//  RenewToken.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/15/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RenewToken {
    var code:Int
    var data:RenewTokenData
    
    init(fromJson json:JSON) {
        self.code = json["code"].intValue
        self.data = RenewTokenData(fromJson: json["data"])
    }
    
}

struct RenewTokenData {
    var token:String
    
    init(fromJson json:JSON) {
        self.token = json["token"].stringValue
    }
    
}
