//
//  ForgetPssdViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/15/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class ForgetPssdViewController: UIViewController {

    var segmentControl: UISegmentedControl!
    var segmentBottomBar:UIView!
    @IBOutlet weak var phoneOrEmailTextField: UITextField!
    @IBOutlet weak var enterAcctTextField: UITextField!
    @IBOutlet weak var validationTextField: UITextField!
    @IBOutlet weak var newPssdTextField: UITextField!
    @IBOutlet weak var reEnterPssdtextField: UITextField!
    @IBOutlet weak var getValidBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    
    var segmentBottomBarLeftcontraint: NSLayoutConstraint!
    var resetPssdCodeID:String!
    
    enum PssdRetreiveType {
        case byPhone
        case byEmail
    }
    
    var pssdRetreiveType:PssdRetreiveType = .byPhone {
        didSet {
            
            switch pssdRetreiveType {
            case .byPhone:
                phoneOrEmailTextField.placeholder = "请输入手机号码 11 码"
                phoneOrEmailTextField.keyboardType = .phonePad
            case .byEmail:
                phoneOrEmailTextField.placeholder = "请输入郵箱地址"
                phoneOrEmailTextField.keyboardType = .emailAddress
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviInformation()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
           setSegmentView()
        
    }
    
    
    @objc func popBackToLogin() {
        if let navi = self.navigationController {
            navi.popViewController(animated: true)
        }
    }
    
    @objc func whenHeadPhoneTapped() {
        
    }
    
    func setSegmentView() {
        segmentControl = UISegmentedControl()
        segmentBottomBar = UIView()
        
        self.view.addSubview(segmentControl)
        self.view.addSubview(segmentBottomBar)
        
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        segmentControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 84).isActive = true
        segmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 44).isActive = true
        segmentControl.insertSegment(withTitle: "手机找回", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "邮箱找回", at: 1, animated: true)

        segmentControl.setSelectedSegmentColor(withTextColor: UIColor.THGreen, backGroundColor: UIColor.clear)
        segmentControl.setNotSelectedSegmentColor(withTextColor: UIColor.THGray, backGroundColor: UIColor.clear)
        segmentControl.addTarget(self, action: #selector(segmentValueDidChange), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        
        segmentBottomBar.translatesAutoresizingMaskIntoConstraints = false
        segmentBottomBar.topAnchor.constraint(equalTo: segmentControl.bottomAnchor).isActive = true
        segmentBottomBar.heightAnchor.constraint(equalToConstant: 3.0).isActive = true
        segmentBottomBar.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments)).isActive = true
        segmentBottomBarLeftcontraint = segmentBottomBar.leftAnchor.constraint(equalTo: segmentControl.leftAnchor, constant: 0)
        segmentBottomBarLeftcontraint.isActive = true
//        segmentBottomBar.leftAnchor.constraint(equalTo: segmentControl.leftAnchor).isActive = true
        segmentBottomBar.backgroundColor = UIColor.THGreen
    }
    
    func setNaviInformation() {
        self.navigationItem.title = "忘记密码"
        
        var image = UIImage(named: "iconBlack")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(popBackToLogin))
        
        var imageHeadPhone = UIImage(named: "iconHeadPhoneW")
        imageHeadPhone = imageHeadPhone?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageHeadPhone, style: .plain, target: self, action: #selector(whenHeadPhoneTapped))
    }
    
    @IBAction func getValidCodeTapped(_ sender: UIButton) {
        // codeID 連同 phone or email 獲得的code 再一起提交出去
        if let name = enterAcctTextField.text {
            
            switch pssdRetreiveType {
                case .byPhone:
                    if let p = phoneOrEmailTextField.text {
                        NetWorkManager.shareInstance.getForgetPssdCode(loginName: name, phone: p) { (getForgetPssdCodeDataModel) in

                            self.resetPssdCodeID = getForgetPssdCodeDataModel.data.codeId
        
                        }
                    }
               case .byEmail:
                    if let e = phoneOrEmailTextField.text {
                        NetWorkManager.shareInstance.getForgetPssdCode(loginName: name, email: e) { (getForgetPssdCodeDataModel) in
                            self.resetPssdCodeID = getForgetPssdCodeDataModel.data.codeId
                        }
                    }
             }
        }

    }
    
    
    @IBAction func confirmBtnTapped(_ sender: UIButton) {
        
        guard let name = self.enterAcctTextField.text else {
            //alertView
            return
        }
     
        guard let code = self.validationTextField.text else {
            //alertView
            return
        }
        
        guard let pssd = self.newPssdTextField.text else {
            //alertView
            return
        }
        
        guard let codeId = self.resetPssdCodeID else {
            //alertView
            return
        }
    
        NetWorkManager.shareInstance.updateNewPssdByCode(loginName: name, code: code, resetPssdCodeID: codeId, newPssd: pssd)
        
        
    }
    
}

extension ForgetPssdViewController {
    
    @objc func segmentValueDidChange(_ sender: UISegmentedControl) {
         switch sender.selectedSegmentIndex {
         case 0:
            self.pssdRetreiveType = .byPhone
            UIView.animate(withDuration: 0.5) {
                self.segmentBottomBarLeftcontraint.constant = 0
                self.segmentBottomBar.layoutIfNeeded()
            }
   
         case 1:
            self.pssdRetreiveType = .byEmail
            UIView.animate(withDuration: 0.5) {
                self.segmentBottomBarLeftcontraint.constant = self.segmentControl.frame.width/2
                self.segmentBottomBar.layoutIfNeeded()
            }


         default:
             break
         }
        
    }
}
