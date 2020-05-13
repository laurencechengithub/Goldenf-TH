//
//  LunchScreenViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/8/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class EnterPointViewController: BaseViewController {
    
    var validUrl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let navigation = self.navigationController {
               navigation.isNavigationBarHidden = true
        }
        getValidPicURL()
//        doSomeLogoEffectHere()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func doSomeLogoEffectHere() {
        //dummy function for when VPN not connected
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 , execute: {
            self.toLoginSB()
        })
        
    }
    
    func toLoginSB() {
        
        let loginSB = UIStoryboard.init(name: "Login", bundle: nil)
        let loginVC = loginSB.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let decodedImage = GlobalFunction.sharedInstance.qrcodeImage(self.validUrl)
        loginVC.validImage = decodedImage
        
        
//        self.navi.pushViewController(loginVC, animated: true)
        
//        performSegue(withIdentifier: "toLogin", sender: nil)
        
 
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    func getValidPicURL() {
        
        NetWorkManager.shareInstance.getValidCode { (validDataModel) in
            self.validUrl = validDataModel.data.img
            self.toLoginSB()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toLogin":
            let destinationVC = segue.destination as! LoginViewController
            let decodedImage = GlobalFunction.sharedInstance.qrcodeImage(self.validUrl)
            destinationVC.validImage = decodedImage
        default:
            break
        }
    }
    


}
