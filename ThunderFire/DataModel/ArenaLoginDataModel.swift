//
//  ThunderFireLoginDataModel.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/6/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ArenaLoginDataModel {
    
    let code: Int
    let data: LoginData
    
    init(fromJson json: JSON) {
        self.code = json["code"].intValue
        self.data = LoginData(fromJson: json["data"])
    }
    
}


struct LoginData {
    let cdn, backend, memberName, token: String
    let loginName, password: String
    let domain, cashierDomain: String
    let wechat: String?
    let vip: Vip
    let balance: Double
    let virtualBalance: Int
    let sportURL, sportToken: String?
    let phoneValidate: Int
    
    init(fromJson json: JSON) {
        self.cdn = json["cdn"].stringValue
        self.backend = json["backend"].stringValue
        self.memberName = json["memberName"].stringValue
        self.token = json["token"].stringValue
        self.loginName = json["loginName"].stringValue
        self.password = json["password"].stringValue
        self.domain = json["domain"].stringValue
        self.cashierDomain = json["cashierDomain"].stringValue
        self.wechat = json["wechat"].stringValue
        self.vip = Vip(fromJson: json["vip"])
        self.balance = json["balance"].doubleValue
        self.virtualBalance = json["virtualBalance"].intValue
        self.sportURL = json["sportURL"].stringValue
        self.sportToken = json["sportToken"].stringValue
        self.phoneValidate = json["phoneValidate"].intValue
        
    }
    
    
}

struct Vip {
    let id, createTime, vipLevel: Int
    let vipName: String
    let levupCredit, credit: Int
    let vipLev: Int?
    let status: Int
    let exclusiveURL, exclusiveWAPURL: String
    let exclusiveAppURL: String
    let exclusiveAppCashierURL: String
    let hbTimes, hbMax: Int
    
    init(fromJson json: JSON) {
        self.id = json["id"].intValue
        self.createTime = json["createTime"].intValue
        self.vipLevel = json["vipLevel"].intValue
        self.vipName = json["vipName"].stringValue
        self.levupCredit = json["levupCredit"].intValue
        self.credit = json["credit"].intValue
        self.vipLev = json["vipLev"].intValue
        self.status = json["status"].intValue
        self.exclusiveURL = json["exclusiveURL"].stringValue
        self.exclusiveWAPURL = json["exclusiveWAPURL"].stringValue
        self.exclusiveAppURL = json["exclusiveAppURL"].stringValue
        self.exclusiveAppCashierURL = json["exclusiveAppCashierURL"].stringValue
        self.hbTimes = json["hbTimes"].intValue
        self.hbMax = json["hbMax"].intValue
        
    }
    
    
}

