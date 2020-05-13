//
//  BaseViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/16/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navigation = self.navigationController {
             navigation.isNavigationBarHidden = true
         }
        
//        let logoImage = UIImage.init(named: "close")
//        let logoImageView = UIImageView.init(image: logoImage)
//        logoImageView.frame = CGRect(x: -40, y: 0, width: 150, height: 25)
//        logoImageView.contentMode = .scaleAspectFit
//        let imageItem = UIBarButtonItem.init(customView: logoImageView)
//        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        negativeSpacer.width = -25
//        self.navigationItem.leftBarButtonItems = [negativeSpacer,imageItem]
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    
    
}
