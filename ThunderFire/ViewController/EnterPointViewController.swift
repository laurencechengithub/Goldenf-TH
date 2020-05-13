//
//  LunchScreenViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/8/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class EnterPointViewController: UIViewController {
    
    var validUrl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getValidPicURL()
        doSomeLogoEffectHere()
    }
    
    func doSomeLogoEffectHere() {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 , execute: {
//
//        })
        
    }
    
    func toLoginSB() {
        performSegue(withIdentifier: "toLogin", sender: nil)
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
            let decoded = self.validUrl.base64Decoded()
            destinationVC.validUrl = decoded
        default:
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
