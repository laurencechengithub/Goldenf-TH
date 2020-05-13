//
//  TypeOneMemberTableViewCell.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/21/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

class TypeOneMemberTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func layoutSubviews() {
        self.contentView.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setData(imageName:String, description:String) {
        
        self.cellImageView.image = UIImage(named: imageName)
        self.cellDescription.text = description
        
    }
    
    
    
}
