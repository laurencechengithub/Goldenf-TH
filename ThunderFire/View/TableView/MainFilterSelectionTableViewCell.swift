//
//  MainFilterSelectionTableViewCell.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/8/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class MainFilterSelectionTableViewCell: UITableViewCell {
    
//    var isChecked = false {
//        didSet {
//            if isChecked == true {
//                print("isChecked = true")
//                self.checkImageView.image = UIImage(named: "check")
//            } else {
//                print("isChecked = false")
//                self.checkImageView.image = UIImage(named: "uncheck")
//            }
//        }
//    }
    var checkImageView = UIImageView()
    var unionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    override func layoutSubviews() {
        self.contentView.backgroundColor = UIColor.black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        
        self.contentView.addSubview(checkImageView)
        self.checkImageView.translatesAutoresizingMaskIntoConstraints = false
        self.checkImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        self.checkImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.checkImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        self.checkImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        self.contentView.addSubview(unionLabel)
        self.unionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.unionLabel.leadingAnchor.constraint(equalTo: self.checkImageView.trailingAnchor, constant: 10).isActive = true
        self.unionLabel.centerYAnchor.constraint(equalTo: self.checkImageView.centerYAnchor).isActive = true
        self.unionLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        self.unionLabel.widthAnchor.constraint(equalToConstant: self.contentView.frame.width * 0.6).isActive = true
        
        
    }
    
    
    
    
}
