//
//  MainRecordCollectionViewCell.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/11/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

//fake data

enum RecordData {
    
}

class MainRecordCollectionViewCell: UICollectionViewCell {
    
    var backView = UIView()
    var recordTableView = UITableView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        self.contentView.backgroundColor = UIColor.THGreen
        
    }
    
    
    
    
    
}
