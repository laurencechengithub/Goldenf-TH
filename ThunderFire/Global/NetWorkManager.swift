//
//  NetWorkManager.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/6/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class NetWorkManager {
    
    static let shareInstance = NetWorkManager()
    static let session = URLSession.shared
    
    private init () {}
    
     enum apiDomain:String {
            case thunderFireApi
            case xianJinApiOne

            var url:String {
                get {
                    switch self {
                     case .thunderFireApi:
                         return "https://arena.wow3craft.com/"
                     case .xianJinApiOne:
                         return "https://xj-sb-asia.prdasbbwla1.com/"
                     }
                }
            }
            
        }
        
        enum apiHeader {
            case TFGeneralHeader
            case XJGeneralHeader
            
            var keyValuePair:HTTPHeaders {
                get {
                    switch self {
                    case .TFGeneralHeader:
                        return ["Content-Type":"application/x-www-form-urlencoded"]
                    case .XJGeneralHeader:
                        return ["":""]
                    }
                }
            }
        }
    
    enum XJAppPageType {
        case bank // 银行卡页面
        case withdrawal // 提款頁面
        case transfer //转账页面
        case records //交易明细
        case letter //站内信
        case hot //热门优惠
        case personal //用户资料
        case cs //客服页面
        case promotion //优惠页面
        case agent //代理页面
        case vip //vip页面
        case findPassword //忘记密码
        case updatePassword //修改密码
        case deposit //存款页面
        
        var stringValue:String {
            get {
                switch self {
                case .bank:
                    return "bank"
                case .withdrawal:
                    return "withdrawal"
                case .transfer:
                    return "transfer"
                case .records:
                    return "records"
                case .letter:
                    return "letter"
                case .hot:
                    return "hot"
                case .personal:
                    return "personal"
                case .cs:
                    return "cs"
                case .promotion:
                    return "promotion"
                case .agent:
                    return "agent"
                case .vip:
                    return "vip"
                case .findPassword:
                    return "findPassword"
                case .updatePassword:
                    return "updatePassword"
                case .deposit:
                    return "deposit"
                }
            }
        }
        
    }
    
    @discardableResult private func baseRequest (
        apiURL url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        completiondHandler: @escaping (_ responseJSON: JSON?) -> ()) -> DataRequest {
        
        return AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { [unowned self] (AFDataResponse) in
            
            
            
            switch AFDataResponse.result {
            case .success(let value):
                let jsonValue = JSON(value)
                if jsonValue["code"].intValue == 0 {
                    completiondHandler(jsonValue)
                } else {
                    print("server responce: \(jsonValue["code"].intValue) : \(jsonValue["message"].stringValue)")
                }
                
            case .failure(let error):
                print("result with error: \(error)")
            }
            
            
            
        }
        
    }
}

//REMARK: 雷火 API
extension NetWorkManager {
    
    //登陆
    func getLoginToken (userName:String,userPSSD:String,completeHandler: @escaping (ArenaLoginDataModel)->()) {
        
        
        let param = ["loginName":userName,
                     "password":userPSSD,
                     "loginType":"loginName",
                     "agentCode":""
        ]
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)member/login",
                    method: .post,
                    parameters: param,
                    headers: apiHeader.TFGeneralHeader.keyValuePair) { (jsonData) in
                        if let data = jsonData {
                            completeHandler(ArenaLoginDataModel(fromJson: data))
                        }
                    
        }
    }
    
    //获取雷火电竞token
    func getThunderFireToken(arenaToken:String,completeHandler: @escaping (ThunderFireToken)->()) {
        
        let param = ["token":arenaToken]
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)esports/token/",
                    method: .post,
                    parameters: param,
                    headers: apiHeader.TFGeneralHeader.keyValuePair) { (jsonData) in
                        if let  data = jsonData {
                            completeHandler(ThunderFireToken(fromJson: data))
                        } else {
                            print("nothing")
                        }
        }
    }
    
    //获取体育URL
    func getThunderFireURL(tokenValue:String,completeHandler: @escaping (ThunderFireSportIndex)->()) {
        
        let header:HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        
        let param = ["channel":"10","token":tokenValue]
        
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)sport/index", method: .get, parameters: param, headers: header) { (jsonData) in
            if let data = jsonData {
                
                completeHandler(ThunderFireSportIndex(fromJSON: data))
            }
        }
        
    }
    
    // 获取嵌入页面
    
//    func getAppPage(pageType:XJAppPageType,completeHandler: @escaping ()->()) {
//        
//        let header:HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded",
//                                  "name":pageType.stringValue]
//        
//        baseRequest(apiURL: "",
//                    method: .get,
//                    headers: <#T##HTTPHeaders?#>, completiondHandler: <#T##(JSON?) -> ()#>)
//        
//    }
    
    
    //获取注册验证码(四位數字img)
    func getValidCode(completeHandler: @escaping (ValidDataModel)->()) {
        
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)member/verificationCode", method: .get) { (jsonData) in
            if let data = jsonData {
                completeHandler(ValidDataModel(fromJson: data))
            }
        }
    }
    
    //注册
    func getRegister(regAcct:String, regPssd:String,regCode:String,regCodeID:String,  completeHandler: @escaping (Bool)->()) {
        
        let param = ["loginName":regAcct,
                     "password":regPssd,
                     "validCode":regCode,
                     "agentCode":"",
                     "token":regCodeID,
                     "regCarrier":"S_IOS"
        ]
        
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)member/quickRegister", method: .post, parameters: param) { (jsonData) in
            completeHandler(true)
        }
        
        
    }
    
    //renewToken
    func renewUserToken(withOld:String,completeHandler: @escaping (RenewToken)->()) {
        
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)", method: .post) { (jsonData) in
            if let data = jsonData {
                completeHandler(RenewToken(fromJson: data))
            }
        }
        
    }
    
    //取得 忘記密碼 驗證碼
    func getForgetPssdCode(loginName:String,phone:String? = nil,email:String? = nil, completeHandler: @escaping (getForgetPssdCodeDataModel) -> ()) {

        var param = ["loginName":loginName]
        
        if phone != nil, let p = phone {
            param.updateValue(p, forKey: "phone")
        } else if phone == nil, let e = email {
            param.updateValue(e, forKey: "email")
        }
    
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)member/getForgetPasswordCode", method: .get, parameters: param) { (jsonData) in
                if let data = jsonData {
                   completeHandler(getForgetPssdCodeDataModel(fromJson: data))
                    
                }
        }
        
        
    }
    //修改密碼
    func updateNewPssdByCode(loginName:String,code:String, resetPssdCodeID:String, newPssd:String) {
        
        let param = ["loginName":loginName,
                     "code":code,
                     "codeId":resetPssdCodeID,
                     "plainPassword":newPssd]
        
        baseRequest(apiURL: "\(apiDomain.thunderFireApi.url)member/updatePasswordByCode", method: .post, parameters: param) { (jsonData) in
            if let data = jsonData {
                
                //dataModel need to be greated
            }
        }
        
        
    }
    
}

//REMARK: 小金 API
extension NetWorkManager {
    
    //小金 存cookie
     func getXianJinCookie(url:String,completeHandler: @escaping (Bool)->()) {
         
         guard let theURL = URL(string: url) else {
             return }
         var request = URLRequest(url: theURL)
         request.httpMethod = "GET"
         request.setValue("https://www.e8127.com/games/sport.html", forHTTPHeaderField: "Referer")
         request.httpShouldHandleCookies = true
         let session = URLSession.shared
         session.configuration.httpCookieAcceptPolicy = .always
         let dataTask = session.dataTask(with: request) { (data, response, error) in
             
            if let err = error {
                print(err)
            } else {
                var cookieProperties = [HTTPCookiePropertyKey: Any]()

                for cookie in HTTPCookieStorage.shared.cookies! {
                    cookieProperties[.name] = cookie.name
                    cookieProperties[.value] = cookie.value
                    cookieProperties[.domain] = cookie.domain
                    cookieProperties[.path] = cookie.path
                    cookieProperties[.version] = cookie.version
                    cookieProperties[.expires] = Date().addingTimeInterval(31536000)

                    let newCookie = HTTPCookie(properties: cookieProperties)
                    HTTPCookieStorage.shared.setCookie(newCookie!)
                    print("cookie name: \(cookie.name) value: \(cookie.value)")

                    GlobalValue.XJcookiKeyValuePair.updateValue(cookie.value, forKey: cookie.name)
                }

                completeHandler(true)
            }
         }

         dataTask.resume()
         
     }
     
    
    //get menu
    
    func getMenu(completeHandler: @escaping (Bool)->()) {
        
        let cookies = HTTPCookieStorage.shared.cookies
        let headers = HTTPCookie.requestHeaderFields(with: cookies!)

        var request = URLRequest(url: URL(string: "\(apiDomain.xianJinApiOne.url)zh-cn/serv/getmenu")!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.setValue("https://www.e8127.com/games/sport.html", forHTTPHeaderField: "Referer")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let json = ["pid":"0",
                    "v":"0"]
        
        let jsonIntoData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonIntoData
        
        
        let dataTask = NetWorkManager.session.dataTask(with: request) { (data, responce, error) in
           
            let responceJson = JSON(data)
            print(responceJson)
            print("sdf")
            
            
            
        }
        
        
        dataTask.resume()
    }
    
    
}


extension NetWorkManager {
    
//    func saveCookies(response: AFDataResponse<Any>) {
//        let headerFields = response.response?.allHeaderFields as! [String: String]
//        let url = response.response?.url
//        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url!)
//        var cookieArray = [[HTTPCookiePropertyKey: Any]]()
//        for cookie in cookies {
//            cookieArray.append(cookie.properties!)
//
//        }
//        UserDefaults.standard.set(cookieArray, forKey: "savedCookies")
//        UserDefaults.standard.synchronize()
//    }
    
    
    func cancelAFRequestFor(url:String) {
        
        Alamofire.Session.default.session.getTasksWithCompletionHandler {
            (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach {
                //只取消指定url的请求
                if ($0.originalRequest?.url?.absoluteString == url) {
                    $0.cancel()
                }
            }
        }
        
    }
    
    
}
