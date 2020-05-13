//
//  PrefarredStatusBar.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/16/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit


class PreferLightStatusNav: UINavigationController, UIGestureRecognizerDelegate {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

}
