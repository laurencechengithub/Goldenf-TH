//
//  ThunderFireToken.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/8/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ThunderFireToken {
    
    var code:Int
    var data:TFTokenData
    
    init(fromJson json: JSON) {
        self.code = json["code"].intValue
        self.data = TFTokenData(fromJson: json["data"])
    }
    
    
}

struct TFTokenData {
    
    var apiV4 : String
    var api : String
    var esportToken:String
    var status:Int
        
    init(fromJson json: JSON) {
        self.apiV4 = json["apiV4"].stringValue
        self.api = json["api"].stringValue
        self.esportToken = json["esportToken"].stringValue
        self.status = json["status"].intValue
    }
    
}
