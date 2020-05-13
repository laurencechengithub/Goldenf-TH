//
//  UItextFieldPlaceholderColor.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/11/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func placeholderColor(color: UIColor) {
        let attributeString = [
            NSAttributedString.Key.foregroundColor : color.withAlphaComponent(0.6),
            NSAttributedString.Key.font            : self.font!
            ] as [NSAttributedString.Key : Any]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
    }
}
