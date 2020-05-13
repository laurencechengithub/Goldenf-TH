//
//  BetCollectionViewCell.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/22/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class BetCollectionViewCell: UICollectionViewCell {
    
    var betCellLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        self.contentView.addSubview(betCellLabel)
        betCellLabel.translatesAutoresizingMaskIntoConstraints = false
        betCellLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        betCellLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        betCellLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        betCellLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        betCellLabel.textAlignment = .center
        betCellLabel.layer.cornerRadius = 13
        betCellLabel.layer.masksToBounds = true
        betCellLabel.backgroundColor = UIColor.clear
    }
    
    
    func setCellLable(betType:[BetType],indexPath:IndexPath) {

        self.betCellLabel.text = betType[indexPath.row].stringValue
        self.betCellLabel.textColor = UIColor.white
  
    }
    
    
    
}
