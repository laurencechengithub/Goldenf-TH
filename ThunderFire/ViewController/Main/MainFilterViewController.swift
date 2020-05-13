//
//  MainFilterViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/7/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

enum GateType {
    case fromEurope
    case fromHongKong
}

enum SequenceType {
    case byUnion
    case byTime
}

class MainFilterViewController: UIViewController {

    @IBOutlet weak var filterMenu: UIView!
    @IBOutlet weak var unionGameLabel: UILabel!
    @IBOutlet weak var gateLeftBtn: UIButton!
    @IBOutlet weak var gateRightBtn: UIButton!
    @IBOutlet weak var gateArrowImage: UIImageView!
    @IBOutlet weak var sequenceLeftBtn: UIButton!
    @IBOutlet weak var sequenceRightBtn: UIButton!
    @IBOutlet weak var sequenceArrowImage: UIImageView!
    var gateType:GateType = .fromEurope
    var squenceType:SequenceType = .byTime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        filterMenu.layer.cornerRadius = 12
        unionGameLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        unionGameLabel.addGestureRecognizer(gesture)
        
        
       self.gateLeftBtn.setTitleColor(UIColor.THGreen, for: .normal)
        self.sequenceRightBtn.setTitleColor(UIColor.THGreen, for: .normal)
        
    }
    
    @objc func labelTapped() {
        performSegue(withIdentifier: "toFilterSelection", sender: nil)
    }
    
    
    @IBAction func betLeftBtnTapped(_ sender: UIButton) {
        
        self.gateLeftBtn.setTitleColor(UIColor.THGreen, for: .normal)
        self.gateRightBtn.setTitleColor(UIColor.THLightGray, for: .normal)
        self.gateArrowImage.image = UIImage(named: "switchLeft")
    }
    
    
    @IBAction func betRightBtnTapped(_ sender: UIButton) {
        self.gateLeftBtn.setTitleColor(UIColor.THLightGray, for: .normal)
        self.gateRightBtn.setTitleColor(UIColor.THGreen, for: .normal)
        self.gateArrowImage.image = UIImage(named: "switchRight")
        
    }
    
    @IBAction func sequenceLeftBtnTapped(_ sender: UIButton) {
        
        self.sequenceLeftBtn.setTitleColor(UIColor.THGreen, for: .normal)
        self.sequenceRightBtn.setTitleColor(UIColor.THLightGray, for: .normal)
        self.sequenceArrowImage.image = UIImage(named: "switchLeft")
        
    }
    
    @IBAction func sequenceRightBtnTapped(_ sender: UIButton) {
        
        self.sequenceLeftBtn.setTitleColor(UIColor.THLightGray, for: .normal)
        self.sequenceRightBtn.setTitleColor(UIColor.THGreen, for: .normal)
        self.sequenceArrowImage.image = UIImage(named: "switchRight")
    }
    
    
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toFilterSelection":
            print("toFilterSelection")
        default:
            break
        }
        
    }

}
