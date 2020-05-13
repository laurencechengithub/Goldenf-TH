//
//  MainBottomTableViewContentCell.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/28/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class MainBottomTableViewContentCell: UITableViewCell {
    
    @IBOutlet weak var cellLeftTopLabel: UILabel!
    @IBOutlet weak var cellLeftBottomCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var cellRightTopLabel: UILabel!
    
    @IBOutlet weak var cellRightTopLabelOffsetOne: UILabel!
    @IBOutlet weak var cellRightTopLabelOffsetTwo: UILabel!
    @IBOutlet weak var cellRightTopLabelOffsetThree: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCollectionViewCellView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        
       
        
    }
    
    
    func setCollectionViewCellView() {
        
   
        
    }
    
}
