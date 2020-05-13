//
//  SignInViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/13/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var acctTextField: UITextField!
    @IBOutlet weak var setPssdTextField: UITextField!
    @IBOutlet weak var reEnterPssdTextField: UITextField!
    @IBOutlet weak var enterValidTextField: UITextField!
    @IBOutlet weak var enterCouponTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInBtn.layer.borderWidth = 1
        logInBtn.layer.borderColor = UIColor(red: 7/255, green: 214/255, blue: 160/255, alpha: 1.0).cgColor
        logInBtn.layer.cornerRadius = 25
        
    }
    

    @IBAction func signInBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func logInBtnTapped(_ sender: UIButton) {
    }
    
}
