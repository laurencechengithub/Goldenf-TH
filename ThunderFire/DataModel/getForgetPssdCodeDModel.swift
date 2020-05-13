//
//  getForgetPssdCodeDModel.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/17/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import SwiftyJSON

struct getForgetPssdCodeDataModel {
    var code:Int
    var data:getForgetPssdCodeData
    
    init(fromJson json:JSON) {
        self.code = json["code"].intValue
        self.data = getForgetPssdCodeData(fromJson: json["data"])
    }
    
}


struct getForgetPssdCodeData {
    var codeId:String
    var nextTime:String
        
    init(fromJson json:JSON) {
        self.codeId = json["codeId"].stringValue
        self.nextTime = json["nextTime"].stringValue
    }
}
