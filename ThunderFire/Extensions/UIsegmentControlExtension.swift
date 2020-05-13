//
//  UIsegmentControlExtension.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/12/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl{
    
    func setSelectedSegmentColor(withTextColor color: UIColor, backGroundColor backColor: UIColor) {
        if #available(iOS 13.0, *) {
            if let font = UIFont(name: "PingFangTC-Semibold", size: 15) {
                let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color,NSAttributedString.Key.font: font]
                self.setTitleTextAttributes(titleTextAttributes, for: .selected)
            } else {
                let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
                self.setTitleTextAttributes(titleTextAttributes, for: .selected)
            }
            self.selectedSegmentTintColor = backColor
        } else {
            self.tintColor = UIColor.white;
        }
    }
    
    func setNotSelectedSegmentColor(withTextColor color: UIColor, backGroundColor backColor: UIColor) {
        if #available(iOS 13.0, *) {
            if let font = UIFont(name: "PingFangTC-Semibold", size: 15) {
                let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color,NSAttributedString.Key.font: font]
                self.setTitleTextAttributes(titleTextAttributes, for: .normal)
            } else {
                let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
                self.setTitleTextAttributes(titleTextAttributes, for: .normal)
            }

            self.selectedSegmentTintColor = backColor
        } else {
            self.tintColor = UIColor.black;
        }
    }
    
    
}
