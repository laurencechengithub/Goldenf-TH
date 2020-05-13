//
//  MainSpecialOfferViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/11/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class MainSpecialOfferViewController: UIViewController {

    @IBOutlet weak var leftTopBarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func leftTopBarButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
