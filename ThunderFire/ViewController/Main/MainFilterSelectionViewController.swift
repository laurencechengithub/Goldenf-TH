//
//  MainFilterSelectionViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/8/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit



class MainFilterSelectionViewController: UIViewController {

    @IBOutlet weak var filterSelectionTableView: UITableView!
    
    var selectedUnion:[Int] = [Int]()
    
    var fakeDataArray = ["法國乙級聯賽1","法國乙級聯賽2","法國乙級聯賽3","法國乙級聯賽4","法國乙級聯賽5","法國乙級聯賽6","法國乙級聯賽7","法國乙級聯賽8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterSelectionTableView.delegate = self
        filterSelectionTableView.dataSource = self
        filterSelectionTableView.allowsMultipleSelection = true
        filterSelectionTableView.register(MainFilterSelectionTableViewCell.self, forCellReuseIdentifier: "MainFilterSelectionTableViewCell")
    }
    
    @IBAction func selectAllUnion(_ sender: UIButton) {
        
    }
    
    
    @IBAction func done(_ sender: UIButton) {
        //pass back selected
        
        //dismiss page
        self.dismiss(animated: true, completion: nil)
        
    }

}


extension MainFilterSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fakeDataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainFilterSelectionTableViewCell", for: indexPath) as! MainFilterSelectionTableViewCell
        cell.unionLabel.text = fakeDataArray[indexPath.row]
        cell.checkImageView.image = UIImage(named: "uncheck")
        for num in selectedUnion {
            if indexPath.row == num {
                cell.checkImageView.image = UIImage(named: "check")
            }
        }
        
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        
        if self.selectedUnion.contains(indexPath.row) {
            self.selectedUnion.remove(at: self.selectedUnion.index(of: indexPath.row)!)
            print(selectedUnion)
        } else {
            self.selectedUnion.append(indexPath.row)
            print(selectedUnion)
        }
        
        tableView.reloadData()
    }
    
}
