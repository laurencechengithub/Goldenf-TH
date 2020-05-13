//
//  SportCollectionViewCell.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/23/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    var sportIconImageView = UIImageView()
    var sportLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
//        contentView.backgroundColor = UIColor.darkGray
    }
    
    func setView() {
        self.contentView.addSubview(sportIconImageView)
        sportIconImageView.translatesAutoresizingMaskIntoConstraints = false
//        sportIconImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
//        sportIconImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
//        sportIconImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
//        sportIconImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -23).isActive = true
        
        sportIconImageView.backgroundColor = UIColor.clear
        sportIconImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25).isActive = true
        sportIconImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        sportIconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sportIconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true

        
        
        self.contentView.addSubview(sportLabel)
        sportLabel.translatesAutoresizingMaskIntoConstraints = false
        sportLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant:-10).isActive = true
        sportLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        sportLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        sportLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
       
        sportLabel.textAlignment = .center
        sportLabel.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
  
    func setCellData (sportTypeArry:[SportType],indexPath:IndexPath) {
        
        let imageString = sportTypeArry[indexPath.row].notSelectedImageString
        let nameString = sportTypeArry[indexPath.row].nameString
        self.sportIconImageView.image = UIImage(named: imageString)
        sportLabel.textColor = UIColor.white
        sportLabel.text = "\(nameString) (12)"
        
    }
    
    
    
}
