//
//  MainOrderRecordViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/8/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

enum RecordType {
    case eGame
    case sport
}

enum RecordCheckStatus {
    case checked
    case unChecked
}


class MainOrderRecordViewController: UIViewController {

    @IBOutlet weak var eGameBtn: UIButton!
    @IBOutlet weak var sportBtn: UIButton!
    @IBOutlet weak var doneCheckOutBtn: UIButton!
    @IBOutlet weak var needCheckOutBtn: UIButton!
    
    var recordCollectionView:UICollectionView!
    var flowItemHeight:CGFloat = 288
    var recordType:RecordType = .sport {
        didSet {
            
            switch recordType {
            case .eGame:
                self.eGameBtn.setTitleColor(UIColor.THGreen, for: .normal)
                self.eGameBtn.setImage(UIImage(named: "esport"), for: .normal)
                self.sportBtn.setTitleColor(UIColor.white, for: .normal)
                self.sportBtn.setImage(UIImage(named: "sportWhite"), for: .normal)
                self.recordCollectionView.reloadData()
                
            case .sport:
                self.sportBtn.setTitleColor(UIColor.THGreen, for: .normal)
                self.sportBtn.setImage(UIImage(named: "sport"), for: .normal)
                self.eGameBtn.setTitleColor(UIColor.white, for: .normal)
                self.eGameBtn.setImage(UIImage(named: "esportWhite"), for: .normal)
                self.recordCollectionView.reloadData()
            }
            
        }
    }

    
    
    //test
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setView()
        
        recordCollectionView.delegate = self
        recordCollectionView.dataSource = self
    }
    
    func setView() {
        
        let viewWidth = self.view.frame.width
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.itemSize = CGSize(width: viewWidth , height: flowItemHeight)
        layoutFlow.scrollDirection = .vertical
        
        self.recordCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layoutFlow)
        self.view.addSubview(recordCollectionView)
        self.recordCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.recordCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.recordCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 236).isActive = true
        self.recordCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.recordCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.recordCollectionView.register(MainRecordCollectionViewCell.self, forCellWithReuseIdentifier: "MainRecordCollectionViewCell")
        
        //
        self.sportBtn.setTitleColor(UIColor.THGreen, for: .normal)
        self.sportBtn.setImage(UIImage(named: "sport"), for: .normal)
        self.eGameBtn.setTitleColor(UIColor.white, for: .normal)
        self.eGameBtn.setImage(UIImage(named: "esportWhite"), for: .normal)
        
    }
    


    
//REMARK: @IBAction
    @IBAction func leftBarButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func egameBtnTapped(_ sender: UIButton) {
        
        self.recordType = .eGame
        
    }
    
    @IBAction func sportBtnTapped(_ sender: UIButton) {
        
        self.recordType = .sport
    }
    
    
    
}


extension MainOrderRecordViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainRecordCollectionViewCell", for: indexPath) as! MainRecordCollectionViewCell
        
        return cell
        
        
    }
    
}


extension MainOrderRecordViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        return CGSize(width: self.view.frame.width, height: 288)
        
    }
    
}
