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
    
    @IBOutlet weak var cellRightBottomCollectionViewOne: UICollectionView!
    
    
    @IBOutlet weak var cellRightBottomCollectionViewTwo: UICollectionView!
    
    
    var match = ["和局","第一盘","第二盘"]
    var matchDeal = ["1.1","1.1","1.1"]
    var matchAsia = ["1.1","1.1"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //left collection View
        cellLeftBottomCollectionView.delegate = self
        cellLeftBottomCollectionView.dataSource = self
        cellLeftBottomCollectionView.isUserInteractionEnabled = false
        
        // right collection View One
        cellRightBottomCollectionViewOne.delegate = self
        cellRightBottomCollectionViewOne.dataSource = self
        
        // right collection View two
        cellRightBottomCollectionViewTwo.delegate = self
        cellRightBottomCollectionViewTwo.dataSource = self
        
        // right collection View three
//        cellRightBottomCollectionViewThree.delegate = self
//        cellRightBottomCollectionViewThree.dataSource = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
  
    }
    
    override func layoutSubviews() {
        
       
        
    }
}


//REMARK: Collection View delegate/data
extension MainBottomTableViewContentCell:UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case cellLeftBottomCollectionView:
            return match.count
        case cellRightBottomCollectionViewOne:
            return 3
        case cellRightBottomCollectionViewTwo:
            return 3
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
         case cellLeftBottomCollectionView:
             guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainBottomTableLeftCollectionViewCell", for: indexPath) as? MainBottomTableLeftCollectionViewCell else {
                 return UICollectionViewCell()
             }
             
             if let label = cell.drawLabel {
                 label.text = match[indexPath.row]
             }
             
             if indexPath.row == 0 {
                 cell.countryOneLabel.textColor = UIColor.white
                 cell.countryTwoLabel.textColor = UIColor.white
             } else {
                 
                 cell.countryOneLabel.isHidden = true
                 cell.countryTwoLabel.isHidden = true
             }
             
             return cell
            
         case cellRightBottomCollectionViewOne:
            
            if indexPath.row == 0 {
                guard let cellOne = collectionView.dequeueReusableCell(withReuseIdentifier: "ThreeLabelCollectionViewCell", for: indexPath) as? ThreeLabelCollectionViewCell else {
                                        return UICollectionViewCell()
                }
                
                if let labeltop = cellOne.topLabel, let labelmiddle = cellOne.middelLabel, let labelBottom = cellOne.bottomLabel {
                    
                    labeltop.text = "1.1"
                    labelmiddle.text = "1.1"
                    labelBottom.text = "1.1"
                }
                            
                return cellOne
            } else {
                
                guard let celltwo = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoLabelCollectionViewCell", for: indexPath) as? TwoLabelCollectionViewCell else {
                    return UICollectionViewCell()
                }

                if let label = celltwo.topLabel {
                    label.text = "1.2"
                }
                
                return celltwo
            }
        
        case cellRightBottomCollectionViewTwo:
            
            if indexPath.row == 0 {
                
                guard let cellOne = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoLargeLabelCollectionViewCell", for: indexPath) as? TwoLargeLabelCollectionViewCell else {
                    return UICollectionViewCell()
                }
                if let labeltop = cellOne.topLabel, let labelBottom = cellOne.bottomLabel {
                    labeltop.text = "1.2"
                    labelBottom.text = "1.5"
                }
                return cellOne
                
            } else {
                
                guard let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoLabelCollectionViewCell", for: indexPath) as? TwoLabelCollectionViewCell else {
                       return UICollectionViewCell()
                }
                if let labeltop = cellTwo.topLabel, let labelBottom = cellTwo.bottomLabel {
                    labeltop.text = "1.2"
                    labelBottom.text = "1.5"
                }
                return cellTwo
            }
            
         default:
             return UICollectionViewCell()
         }
        

    
    }
    
}

extension MainBottomTableViewContentCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case cellLeftBottomCollectionView:
            if indexPath.row == 0 {
                return CGSize(width: 128, height: 116) // (36*3) + (2*4)
            } else {
                return CGSize(width: 128, height: 78) // (36*2) + (2*6)
            }
        case cellRightBottomCollectionViewOne:
            if indexPath.row == 0 {
                return CGSize(width: 90, height: 116)
            } else {
                return CGSize(width: 90, height: 78)
            }
        case cellRightBottomCollectionViewTwo:
            if indexPath.row == 0 {
                  return CGSize(width: 90, height: 116)
              } else {
                  return CGSize(width: 90, height: 78)
              }
        default:
            return CGSize(width: 10, height: 10)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch collectionView {
        case cellLeftBottomCollectionView:
            return 2
        case cellRightBottomCollectionViewOne:
            return 2
        case cellRightBottomCollectionViewTwo:
            return 2
        default:
            return 0
        }
    }
    
    
    
}
