//
//  MainViewController.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/7/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit

enum GameType {
    
    case gaming
    case sport
    
}

enum BetType: Int, CaseIterable {
    
    case roll = 1
    case today
    case morning
    case grape
    case champane
    
    var stringValue:String {
        get {
            switch self {
            case .roll:
                return "滚球"
            case .today:
                return "今日"
            case .morning:
                return "早盘"
            case .grape:
                return "连串"
            case .champane:
                return "冠军"
            }
        }
    }
}

enum SportType: Int, CaseIterable{
    case soccer = 1
    case basketBall
    case tennis
    case baseBall
    case golf
    case lottery
    case football
    case boxing
    case baminton
    case finance
    case missUniverse
    case volleyball
    case rugby
    case unique
    case handball
    case racing
    case cricket
    case beachSoccer
    case table
    case snooker
    case softball
    case esports
    case futsal
    case darts
    case hockey
    case beachVolleyball
    case waterball
    case fieldHockey
    case bicycle
    case gymnastics
    case athletics
    case sailboat
    case swim

    var selectedImageString:String {

        get {
            switch self {
            case .soccer:
                return "soccer"
            case .basketBall:
                return "basketball"
            case .tennis:
                return "tennis"
            case .baseBall:
                return "baseball"
            case .golf:
                return "golf"
            case .lottery:
                return "lottery"
            case .rugby:
                return "football"
            case .boxing:
                return "boxing"
            case .baminton:
                return "badminton"
            case .finance:
                return "financial"
            case .missUniverse:
                return "missUniverse"
            case .volleyball:
                return "volleyball"
            case .football:
                return "football"
            case .unique:
                return "unique"
            case .handball:
                return "handball"
            case .racing:
                return "racing"
            case .cricket:
                return "cricket"
            case .beachSoccer:
                return "beachSoccer"
            case .table:
                return "table"
            case .snooker:
                return "snooker"
            case .softball:
                return "softball"
            case .esports:
                return "esports"
            case .futsal:
                return "futsal"
            case .darts:
                return "darts"
            case .hockey:
                return "hockey"
            case .beachVolleyball:
                return "beachVolleyball"
            case .waterball:
                return "beachVolleyball"
            case .fieldHockey:
                return "fieldHockey"
            case .bicycle:
                return "bicycle"
            case .gymnastics:
                return "gymnastics"
            case .athletics:
                return "athletics"
            case .sailboat:
                return "sailboat"
            case .swim:
                return "swim"
            }
        }

    }
    var notSelectedImageString:String {
        
        get {
            switch self {
            case .soccer:
                return "soccerB"
            case .basketBall:
                return "basketballB"
            case .tennis:
                return "tennisB"
            case .baseBall:
                return "baseballB"
            case .golf:
                return "golfB"
            case .lottery:
                return "lotteryB"
            case .rugby:
                return "footballB"
            case .boxing:
                return "boxingB"
            case .baminton:
                return "badmintonB"
            case .finance:
                return "financialB"
            case .missUniverse:
                return "missUniverseB"
            case .volleyball:
                return "volleyballB"
            case .football:
                return "footballB"
            case .unique:
                return "uniqueB"
            case .handball:
                return "handballB"
            case .racing:
                return "racingB"
            case .cricket:
                return "cricketB"
            case .beachSoccer:
                return "beachSoccerB"
            case .table:
                return "tableB"
            case .snooker:
                return "snookerB"
            case .softball:
                return "softballB"
            case .esports:
                return "esportsB"
            case .futsal:
                return "futsalB"
            case .darts:
                return "dartsB"
            case .hockey:
                return "hockeyB"
            case .beachVolleyball:
                return "beachVolleyballB"//share the same pic
            case .waterball:
                return "beachVolleyballB"//share the same pic
            case .fieldHockey:
                return "fieldHockeyB"
            case .bicycle:
                return "bicycleB"
            case .gymnastics:
                return "gymnasticsB"
            case .athletics:
                return "athleticsB"
            case .sailboat:
                return "sailboatB"
            case .swim:
                return "swimB"
            }
        }
        
    }
    var nameString:String {
        get {
            switch self {
            case .soccer:
                return "足球"
            case .basketBall:
                return "籃球"
            case .tennis:
                return "網球"
            case .baseBall:
                return "棒球"
            case .golf:
                return "高爾夫"
            case .lottery:
                return "彩票"
            case .football:
                return "美式足球"
            case .boxing:
                return "拳擊"
            case .baminton:
                return "羽球"
            case .finance:
                return "金融"
            case .missUniverse:
                return "環球小姐"
            case .volleyball:
                return "排球"
            case .rugby:
                return "橄欖球"
            case .unique:
                return "特別賽事"
            case .handball:
                return "手球"
            case .racing:
                return "賽車"
            case .cricket:
                return "板球"
            case .beachSoccer:
                return "沙灘足球"
            case .table:
                return "桌球"
            case .snooker:
                return "台球/斯諾克"
            case .softball:
                return "壘球"
            case .esports:
                return "電子競技"
            case .futsal:
                return "室內足球"
            case .darts:
                return "飛鏢"
            case .hockey:
                return "冰上曲棍球"
            case .beachVolleyball:
                return "沙灘排球"
            case .waterball:
                return "水球"
            case .fieldHockey:
                return "草地曲棍球"
            case .bicycle:
                return "自行車"
            case .gymnastics:
                return "體操"
            case .athletics:
                return "田徑"
            case .sailboat:
                return "帆船"
            case .swim:
                return "游泳"
            }
        }
    }
    
}




class MainViewController: UIViewController {

    
    @IBOutlet weak var eGameBtn: UIButton!
    @IBOutlet weak var sportBtn: UIButton!
    @IBOutlet weak var memberPageBtn: UIButton!
    @IBOutlet weak var mainSegBottomView: UIView!

    
    var betCollectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 61, height: 26)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BetCollectionViewCell.self, forCellWithReuseIdentifier: "BetCollectionViewCell")
        return collectionView
    }()
    
    var sportCollectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 70, height: 68)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: "SportCollectionViewCell")
        return collectionView
    }()
    
    var theTableView: UITableView!
    
    var sectionTitleArray = [
        section(sectionClass: "世界杯亞洲預賽",
                name: ["dummy1"],
                expanded: true),
        section(sectionClass: "世界杯亞洲預賽",
                name: ["dummy2"],
                expanded: false),
        section(sectionClass: "世界杯亞洲預賽",
                name: ["dummy3"],
                expanded: false)
    ]
    

    
    
    var mainSegBotViewLeadingConstraint:NSLayoutConstraint!
    var tableViewSectionNumber = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let navi = navigationController {
            navi.isNavigationBarHidden = true
  
        }
        
        let screenSize = UIScreen.main.bounds
        
        //set btn underLine
        mainSegBotViewLeadingConstraint = mainSegBottomView.leadingAnchor.constraint(equalTo: self.eGameBtn.leadingAnchor, constant: 20)
        mainSegBotViewLeadingConstraint.isActive = true
        
        //set collectionView
        setTwoCollectionView()
    
        
        //set mainTableView
        setTable()
        self.theTableView.delegate = self
        self.theTableView.dataSource = self
        
        
        //test//
        eGameBtn.backgroundColor = UIColor.darkGray
        betCollectionView.backgroundColor = UIColor.darkGray
        sportCollectionView.backgroundColor = UIColor.lightGray
        
        
    }
    
    @IBAction func memberBtnTapped(_ sender: UIButton) {
        
    }
    
    func setTable() {
        theTableView = UITableView()
        self.view.addSubview(theTableView)
        theTableView.translatesAutoresizingMaskIntoConstraints = false
        theTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        theTableView.topAnchor.constraint(equalTo: self.sportCollectionView.bottomAnchor, constant: 10).isActive = true
        theTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        theTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        theTableView.register(MainSectionOneLeftStaticTableCell.self, forCellReuseIdentifier: "SectionOneLeftOneStaticTableCell")
    }
    
    func setTwoCollectionView() {

        betCollectionView.delegate = self
        betCollectionView.dataSource = self
        sportCollectionView.delegate = self
        sportCollectionView.dataSource = self
        self.view.addSubview(betCollectionView)
        betCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        betCollectionView.topAnchor.constraint(equalTo: self.eGameBtn.bottomAnchor, constant: 5).isActive = true
        betCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 13).isActive = true
        betCollectionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.view.addSubview(sportCollectionView)
        sportCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        sportCollectionView.topAnchor.constraint(equalTo: self.betCollectionView.bottomAnchor, constant: 0).isActive = true
        sportCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 13).isActive = true
        sportCollectionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toMember":
            print("prepare toMemeber")
        default:
            break
        }
    }

    @IBAction func eGameBtnTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {

            self.mainSegBotViewLeadingConstraint.constant = 20
            
            self.mainSegBottomView.layoutIfNeeded()
        }
        
    }
    
    @IBAction func sportBtnTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {

             self.mainSegBotViewLeadingConstraint.constant = 82
             self.mainSegBottomView.layoutIfNeeded()
         }
        
        
    }
    

}


//REMARK: UICollectionView Delegate/Data
extension MainViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case betCollectionView :
            return BetType.allCases.count
        case sportCollectionView:
            print("count:\(SportType.allCases.count)")
            return SportType.allCases.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case betCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BetCollectionViewCell", for: indexPath) as! BetCollectionViewCell
            
            cell.setCellLable(betType: BetType.allCases, indexPath: indexPath)
            
            return cell
            
        case sportCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
            
            cell.setCellData(sportTypeArry: SportType.allCases, indexPath: indexPath)
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case betCollectionView :
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? BetCollectionViewCell {
                let label = selectedCell.betCellLabel
                label.backgroundColor = UIColor.THGreen
            }

        case sportCollectionView :
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? SportCollectionViewCell {
                let selectString = SportType.allCases[indexPath.row].selectedImageString
                selectedCell.sportIconImageView.image = UIImage(named:selectString)
                selectedCell.sportLabel.textColor = UIColor.THGreen
                
            }
   
            
        default:
            break
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case betCollectionView :
            if let deSelectedCell = collectionView.cellForItem(at: indexPath) as? BetCollectionViewCell {
                let label = deSelectedCell.betCellLabel
                label.backgroundColor = UIColor.clear
            }


        case sportCollectionView :
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? SportCollectionViewCell {
                let deSelectString = SportType.allCases[indexPath.row].notSelectedImageString
                selectedCell.sportIconImageView.image = UIImage(named:deSelectString)
                selectedCell.sportLabel.textColor = UIColor.white
            }
            
        default:
            break
        }
        
        
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
                return sectionTitleArray.count
            }

            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                return sectionTitleArray[section].name.count
            }
            
            
            func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return self.view.frame.height/10
            }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                // Section中 row的高度
                // 若expanded為false，row高度為0
                
                    if sectionTitleArray[indexPath.section].expanded == true {
                        return 120
                    } else {
                        return 0
                    }
            }
            
            func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
                return 3
            }
            
            func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
                // 宣告每一個section header的view
                let header = ExpandableHeaderView()
                header.customInit(title: sectionTitleArray[section].sectionClass, section: section, delegate: self)
          
                return header
            }
            
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                // 宣告每一個row
                let cell = tableView.dequeueReusableCell(withIdentifier: "SectionOneLeftOneStaticTableCell") as! MainSectionOneLeftStaticTableCell
                
    //            if let cellLabel = cell.cellLabel {
    //                cellLabel.text = sectionTitleArray[indexPath.section].name[indexPath.row]
    //            }
                
                return cell
            }
    
}


extension MainViewController: ExpandableHeaderViewDelegate {
    
    
    func toggleSectionWith(header: ExpandableHeaderView, andSection: Int) {
        sectionTitleArray[andSection].expanded = !(sectionTitleArray[andSection].expanded)
    
        theTableView.beginUpdates()
        for i in 0 ..< sectionTitleArray[andSection].name.count {
        
            theTableView.reloadRows(at: [IndexPath(row: i, section: andSection)], with: .automatic)
        }
        theTableView.endUpdates()
        
    }
    
}
