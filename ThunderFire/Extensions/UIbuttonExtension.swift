//
//  UIbuttonExtension.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/11/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit

class EffertButton: UIButton {
    
    @IBAction func EffertButtonTouched(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
                        },
                         completion: { finish in
                                UIButton.animate(withDuration: 0.2, animations: {
                                    sender.transform = CGAffineTransform.identity })
        })
    }
    
    
    
}



