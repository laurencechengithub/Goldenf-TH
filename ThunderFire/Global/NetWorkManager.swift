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
    
    let shareInstance = NetWorkManager()
    
    private init () {}
    
    private func baseRequest(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        completiondHandler: @escaping (_ responseJSON: JSON?) -> ()) -> DataRequest {
        
            
        
        return AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (AFDataResponse) in
            
            switch AFDataResponse.result {
            case .success(let value):
                let jsonValue = JSON(value)
                switch jsonValue["code"].intValue {
                case 0 :
                    print("sdf")
                default:
                    break
                }
            case .failure(let error):
                print("result with error: \(error)")
            }
            
        }
        
    }
    
}
