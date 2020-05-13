//
//  MemberViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/21/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class MemberViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headPhoneBtn: UIButton!
    
    @IBOutlet weak var memberPic: UIImageView!
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberVipLV: UILabel!
    @IBOutlet weak var memberDataBtn: UIButton!
    @IBOutlet weak var vipDetailBtn: UIButton!
    @IBOutlet weak var joinVentureBtn: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var depositeBtn: UIButton!
    @IBOutlet weak var withDrawBtn: UIButton!
    @IBOutlet weak var transferBtn: UIButton!
    
    @IBOutlet weak var memberTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navi = navigationController{
            navi.isNavigationBarHidden = true
        }
        setView()
        
        
    }
    
    func setView() {
        
        vipDetailBtn.layer.borderWidth = 1
        vipDetailBtn.layer.borderColor = UIColor.THGreen.cgColor
        vipDetailBtn.layer.cornerRadius = 14
        
        joinVentureBtn.layer.borderWidth = 1
        joinVentureBtn.layer.borderColor = UIColor.THGreen.cgColor
        joinVentureBtn.layer.cornerRadius = 14
        
        depositeBtn.layer.cornerRadius = 5
        withDrawBtn.layer.cornerRadius = 5
        transferBtn.layer.cornerRadius = 5
        
        memberTableView.delegate = self
        memberTableView.dataSource = self
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


extension MemberViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypeOneMemberTableViewCell", for: indexPath) as! TypeOneMemberTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.setData(imageName: "money", description: "投注纪录")
        case 1:
            cell.setData(imageName: "refund", description: "交易明細")
        case 2:
            cell.setData(imageName: "card", description: "银行卡管理")
        case 3:
            cell.setData(imageName: "present", description: "优惠领取")
        case 4:
            cell.setData(imageName: "notice", description: "站内信箱")
        case 5:
            cell.setData(imageName: "setting", description: "设置")
        default:
            break
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
           case 0:
            print("selected 0")
           case 1:
            print("selected 1")
           case 2:
            print("selected 2")
           case 3:
            print("selected 3")
           case 4:
            print("selected 4")
           case 5:
            print("selected 5")
       default:
           break
       }
        
    }
    
    
}
