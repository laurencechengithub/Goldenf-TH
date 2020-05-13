//
//  CustomAlertViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/4/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    
    var centerView:UIView!
    var middleLabel:UILabel!
    var closeBtn:UIButton!
    var labelText:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        setView()
        
    }
        
    
    private func setView () {
        
        centerView = UIView()
        self.view.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        centerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.7).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.2).isActive = true
        centerView.backgroundColor = UIColor.darkGray
        
        middleLabel = UILabel()
        self.centerView.addSubview(middleLabel)
        middleLabel.translatesAutoresizingMaskIntoConstraints = false
        middleLabel.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor, constant: 10).isActive = true
        middleLabel.topAnchor.constraint(equalTo: self.centerView.topAnchor, constant: 30).isActive = true
        middleLabel.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor, constant: -10).isActive = true
        middleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        middleLabel.textAlignment = .center
        middleLabel.backgroundColor = UIColor.clear
        middleLabel.textColor = UIColor.white
        middleLabel.text = labelText
        
        
        closeBtn = UIButton()
        self.centerView.addSubview(closeBtn)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.leadingAnchor.constraint(equalTo: self.centerView.leadingAnchor).isActive = true
        closeBtn.bottomAnchor.constraint(equalTo: self.centerView.bottomAnchor).isActive = true
        closeBtn.trailingAnchor.constraint(equalTo: self.centerView.trailingAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        closeBtn.setTitle("确认", for: .normal)
        closeBtn.backgroundColor = UIColor.THGreen
        closeBtn.setTitleColor(UIColor.white, for: .normal)
        closeBtn.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        
        
    }
    
    @objc func closeBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
