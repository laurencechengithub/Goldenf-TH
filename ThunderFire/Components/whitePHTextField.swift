//
//  whitePHTextField.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/16/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class whitePHTextField:UITextField {
    
//    @IBInspectable override var placeholder: String? {
//        didSet {
//            self.setPlaceHolderColor()
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//
//    }
  
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setPlaceHolderColor()
    }
    
    private func setPlaceHolderColor() {
        let phString = self.placeholder != nil ? placeholder! : ""
        self.attributedPlaceholder = NSAttributedString(string: phString, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
    }
}
