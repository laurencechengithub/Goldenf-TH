//
//  UItextFieldBottumLine.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/13/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setBottomBorder(bottomLineColor lineColor:UIColor) {
        self.borderStyle = .none
//        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = lineColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
