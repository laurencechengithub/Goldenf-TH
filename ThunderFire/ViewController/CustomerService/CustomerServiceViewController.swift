//
//  CustomerServiceViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/12/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class CustomerServiceViewController: UIViewController {

    
    @IBOutlet weak var leftBarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func leftBarButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    


}
