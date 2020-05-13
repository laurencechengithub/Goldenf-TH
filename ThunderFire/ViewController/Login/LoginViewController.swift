//
//  LoginViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/7/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var loginMethodSegment: UISegmentedControl!
    @IBOutlet var acct: UITextField!
    @IBOutlet var pssd: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet weak var valid: UITextField!
    @IBOutlet weak var signINBtn: UIButton!
    @IBOutlet weak var remPssdBtn: UIButton!
    @IBOutlet weak var forgetPssdBtn: UIButton!
    @IBOutlet weak var validCodeImageView: UIImageView!
    
    
    var arenaLoginDataModel:ArenaLoginDataModel!
    var validImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }

    override func viewWillAppear(_ animated: Bool) {
        if let navigation = self.navigationController {
              navigation.isNavigationBarHidden = true
        }
        setViewSegment()
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let navigation = self.navigationController {
             navigation.isNavigationBarHidden = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        acct.delegate = self
        pssd.delegate = self
        valid.delegate = self
        changeSegmentDisplayColor(selectedIndex: 0)
        loginBtn.showsTouchWhenHighlighted = true
        
    }
    
    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {
        let selected = sender.selectedSegmentIndex

        UIView.animate(withDuration: 0.3) {
            
            sender.subviews[1].layer.borderColor = UIColor.clear.cgColor
            sender.subviews[0].layer.borderColor = UIColor.clear.cgColor
            
            if selected == 0 {
                
                self.changeSegmentDisplayColor(selectedIndex: 0)
            
            } else if selected == 1 {
                
                self.changeSegmentDisplayColor(selectedIndex: 1)
            }
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
////        ===test
//        toMain()
////        ======
        
        // check acct
        guard let acct = acct.text, let pssd = pssd.text else {
            print("acct pssd textField = nil")
            return
        }

        guard acct != "" else {
            let cusAlertVC = CustomAlertViewController()
            cusAlertVC.labelText = "帐号输入错误，请重新输入"
            self.present(cusAlertVC, animated: false)
            return
        }

        // check pssd
        guard pssd != "" else {
            let cusAlertVC = CustomAlertViewController()
            cusAlertVC.labelText = "密码输入错误，请重新输入"
            self.present(cusAlertVC, animated: false)
            return
        }

        //get arena login token
        let encodedPssd = GlobalFunction.sharedInstance.encodeMD5(string: pssd).uppercased()
        print("MD5 encodedPssd : \(encodedPssd)")

        callArenaToken(user: acct, encodedPssd: encodedPssd)
    
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignIn", sender: nil)
    }
    
    @IBAction func forgetPssdBtnTapped(_ sender: UIButton) {
        pushForgetPssd()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toMain":
            print("prepare to Main")
        case "toSignIn":
            print("prepare to toSignIn")
        default:
            break
        }
    }

}

//REMARK: initViews
extension LoginViewController {
    
    func setView() {
        
        acct.attributedPlaceholder = NSAttributedString(string: "请输入帐号", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        pssd.attributedPlaceholder = NSAttributedString(string: "请输入密码", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        valid.attributedPlaceholder = NSAttributedString(string: "输入验证码", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        //SignInBtn
        signINBtn.layer.borderWidth = 1
        signINBtn.layer.borderColor = UIColor(red: 7/255, green: 214/255, blue: 160/255, alpha: 1).cgColor
        signINBtn.layer.cornerRadius = 25
        
        //forgetPssdBtn
        let forgetPssdBtnAttribute:[NSAttributedString.Key:Any] = [.underlineStyle:NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "忘记密码？", attributes: forgetPssdBtnAttribute)
        forgetPssdBtn.setAttributedTitle(attributeString, for: .normal)
        
        if let img = self.validImage {
            self.validCodeImageView.image = img
        }
        
        
        
    }
    
    func setViewSegment() {
        
        loginMethodSegment.selectedSegmentIndex = 0
        loginMethodSegment.layer.cornerRadius = 10
        loginMethodSegment.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        loginMethodSegment.setNotSelectedSegmentColor(withTextColor: UIColor.lightGray, backGroundColor: UIColor.clear)
        
        loginMethodSegment.setSelectedSegmentColor(withTextColor: UIColor(red: 7/255, green: 214/255, blue: 160/255, alpha: 1), backGroundColor: UIColor.clear)
    }
    
    
    
}


//REMARK: Call Request
extension LoginViewController {
    
    func callArenaToken(user:String,encodedPssd:String) {
       NetWorkManager.shareInstance.getLoginToken(userName: user, userPSSD: encodedPssd) { (loginData) in
           if loginData.code == 0 {
               GlobalValue.userToken = loginData.data.token
               print("userLoginToken : \(GlobalValue.userToken)")
               self.callTFtoken(usertoken: GlobalValue.userToken)
           }

       }
    }

    func callTFtoken(usertoken:String) {
       NetWorkManager.shareInstance.getThunderFireToken(arenaToken: usertoken) { (TFTokenData) in
           
           if TFTokenData.code == 0 {
               GlobalValue.TFtoken = TFTokenData.data.esportToken
               print("esportToken : \(GlobalValue.TFtoken)")
               self.callTFUrl()
           }
       }
    }

    func callTFUrl() {
       
       NetWorkManager.shareInstance.getThunderFireURL(tokenValue: GlobalValue.userToken) { (TFURLData) in
           if TFURLData.code == 0 {
            GlobalValue.TFUrl = TFURLData.data.url
            print("體育url : \(TFURLData.data.url)")
            self.getXJLaunchCookie()
           }
       }
    }
    
    func getXJLaunchCookie() {
        
        NetWorkManager.shareInstance.getXianJinCookie(url: GlobalValue.TFUrl) { (bool) in
            if bool == true {
                self.getXJMenu()
            } else {
                //alart view
            }
        }
        
        
    }
    
    func getXJMenu() {
        NetWorkManager.shareInstance.getMenu { (bool) in
            if bool == true {
                DispatchQueue.main.async {
                    self.toMain()
                }
            } else {
                //alart view
            }
        }
    }
    
    
    func toMain() {
       //toMain
       performSegue(withIdentifier: "toMain", sender: nil)
    }
    
    func pushForgetPssd() {
        
        let forgetPssdVC = self.storyboard?.instantiateViewController(identifier: "ForgetPssdViewController") as! ForgetPssdViewController
         
         self.navigationController?.pushViewController(forgetPssdVC, animated: true)
        
    }
    
}

//REMARK: SelfDefine Functions
extension LoginViewController {
    
    func changeSegmentDisplayColor(selectedIndex:Int) {
        
        if selectedIndex == 0 {
            loginMethodSegment.subviews[0].layer.borderWidth = 1
            loginMethodSegment.subviews[0].layer.cornerRadius = 10
            loginMethodSegment.subviews[0].layer.borderColor = UIColor(red: 7/255, green: 214/255, blue: 160/255, alpha: 1).cgColor
            
            loginMethodSegment.subviews[1].layer.borderWidth = 1
            loginMethodSegment.subviews[1].layer.cornerRadius = 10
            loginMethodSegment.subviews[1].layer.borderColor = UIColor.clear.cgColor
        } else if selectedIndex == 1 {
            
            loginMethodSegment.subviews[1].layer.borderWidth = 1
            loginMethodSegment.subviews[1].layer.cornerRadius = 10
            loginMethodSegment.subviews[1].layer.borderColor = UIColor(red: 7/255, green: 214/255, blue: 160/255, alpha: 1).cgColor
            
            loginMethodSegment.subviews[0].layer.borderWidth = 1
            loginMethodSegment.subviews[0].layer.cornerRadius = 10
            loginMethodSegment.subviews[0].layer.borderColor = UIColor.clear.cgColor
        }
    }

}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
}
