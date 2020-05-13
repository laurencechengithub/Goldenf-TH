//
//  Base64Crytion.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/13/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
}
