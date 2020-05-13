//
//  ValidDataModel.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/13/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ValidDataModel {
    var code:Int
    var data:ValidData
    
    init(fromJson json: JSON) {
        self.code = json["code"].intValue
        self.data = ValidData(fromJson: json["data"])
    }
}


struct ValidData {
    var img:String
    var id:String
    
    init(fromJson json: JSON) {
        self.img = json["img"].stringValue
        self.id = json["id"].stringValue
    }
    
}
