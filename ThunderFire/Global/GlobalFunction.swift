//
//  GlobalFunction.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/13/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit
import CryptoKit

struct GlobalFunction {
    
    static let sharedInstance = GlobalFunction()
    
    private init() { }
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 1))
        let image = UIImage(data: imageData!)
        return image!
    }
    
    func qrcodeImage(_ base64: String) -> UIImage? {
        if let url = URL(string: base64) {
            if let data = try? Data(contentsOf: url) {
                return UIImage(data: data)
            }
        }
        return nil
    }
    
    func encodeMD5(string:String) -> String {
          let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
          
          return digest.map({
              String(format: "%02hhx", $0)
              }).joined()
    }
    
    
}
