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
                return "soccerW"
            case .basketBall:
                return "basketballW"
            case .tennis:
                return "tennisW"
            case .baseBall:
                return "baseballW"
            case .golf:
                return "golfW"
            case .lottery:
                return "lotteryW"
            case .rugby:
                return "footballW"
            case .boxing:
                return "boxingW"
            case .baminton:
                return "badmintonW"
            case .finance:
                return "financialW"
            case .missUniverse:
                return "missUniverseW"
            case .volleyball:
                return "volleyballW"
            case .football:
                return "footballW"
            case .unique:
                return "uniqueW"
            case .handball:
                return "handballW"
            case .racing:
                return "racingW"
            case .cricket:
                return "cricketW"
            case .beachSoccer:
                return "beachSoccerW"
            case .table:
                return "tableW"
            case .snooker:
                return "snookerW"
            case .softball:
                return "softballW"
            case .esports:
                return "esportsW"
            case .futsal:
                return "futsalW"
            case .darts:
                return "dartsW"
            case .hockey:
                return "hockeyW"
            case .beachVolleyball:
                return "beachVolleyballW"//share the same pic
            case .waterball:
                return "beachVolleyballW"//share the same pic
            case .fieldHockey:
                return "fieldHockeyW"
            case .bicycle:
                return "bicycleW"
            case .gymnastics:
                return "gymnasticsW"
            case .athletics:
                return "athleticsW"
            case .sailboat:
                return "sailboatW"
            case .swim:
                return "swimW"
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

struct cellData {
    var open = Bool()
    var title = String()
    var sectionData = [String]()
}


class MainViewController: UIViewController {

    
    @IBOutlet weak var eGameBtn: UIButton!
    @IBOutlet weak var sportBtn: UIButton!
    @IBOutlet weak var memberPageBtn: UIButton!
    @IBOutlet weak var mainSegBottomView: UIView!
    @IBOutlet weak var mainBottomTable: UITableView!
    
    @IBOutlet weak var bottomReturnTopBar: UIView!
    @IBOutlet weak var returnTopBtn: UIButton!
    @IBOutlet weak var returnTopBtnBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var bottomMenuBar: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var menuBtnLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuFilterBtn: UIButton!
    @IBOutlet weak var menuSpecialOfferBtn: UIButton!
    @IBOutlet weak var menuOrderBtn: UIButton!
    @IBOutlet weak var menuServeBtn: UIButton!
    
    
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

    private var scrollViewlastContentOffset: CGFloat = 0
    var mainSegBotViewLeadingConstraint:NSLayoutConstraint!
    var mainBottomtableViewData = [cellData]()
    var isMenuBtnOpen = false
    var isFirstTimeEnterMain = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Test : fake data==
        mainBottomtableViewData = [
                        cellData(open: true, title: "世界杯亞洲預賽", sectionData: ["cell1"]),
                         cellData(open: true, title: "世界杯亞洲預賽", sectionData: ["cell1"]),
                         cellData(open: true, title: "世界杯亞洲預賽", sectionData: ["cell1"]),
                         cellData(open: true, title: "世界杯亞洲預賽", sectionData: ["cell1"])
                        ]
        //===
        mainBottomTable.delegate = self
        mainBottomTable.dataSource = self
        mainBottomTable.bounces = false
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let navi = navigationController {
            navi.isNavigationBarHidden = true }
        
        let screenSize = UIScreen.main.bounds
        
        //set main top two btn
        mainSegBotViewLeadingConstraint = mainSegBottomView.leadingAnchor.constraint(equalTo: self.eGameBtn.leadingAnchor, constant: 82)
        mainSegBotViewLeadingConstraint.isActive = true
        self.sportBtn.setTitleColor(UIColor.THGreen, for: .normal)
        
        //set collectionView
        setTwoCollectionView()

        //set bottomMenuBar
        self.bottomMenuBar.layer.cornerRadius = 27
        self.bottomMenuBar.backgroundColor = UIColor.darkGray
        
        //set bottomReturnTopBar
        bottomReturnTopBar.layer.cornerRadius = 27

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //pre select to first cell
        
        if isFirstTimeEnterMain {
            isFirstTimeEnterMain = false
            let preSelect:IndexPath = IndexPath(row: 0, section: 0)
            //        self.collectionView(betCollectionView, didSelectItemAt: preSelect)
            self.collectionView(sportCollectionView, didSelectItemAt: preSelect)
        }
        
    }
    
//REMARK: IBAction
    
    @IBAction func returnTopBtnTapped(_ sender: UIButton) {
        
        if let tableView = mainBottomTable {
            tableView.setContentOffset(.zero, animated: true)
            
        }
        
    }
    
    
    @IBAction func memberBtnTapped(_ sender: UIButton) {
        // perform segue to memeber page
    }
    
    @IBAction func menuBtnTapped(_ sender: UIButton) {
       
        if !isMenuBtnOpen {
            isMenuBtnOpen = true
            self.bottomMenuBar.backgroundColor = UIColor.THGreen
            UIView.animate(withDuration: 0.25) {
                self.menuBtnLeadingConstraint.constant = -340
                self.menuBtn.setBackgroundImage(UIImage(named: "fabCloseWhite"), for: .normal)
                self.returnTopBtnBottomConstraint.constant = -94
            }
        } else {
            isMenuBtnOpen = false
            
            UIView.animate(withDuration: 0.25, animations: {
                self.menuBtnLeadingConstraint.constant = -60
                self.menuBtn.setBackgroundImage(UIImage(named: "fabmoreWhite"), for: .normal)
            }) { (bool) in
                self.bottomMenuBar.backgroundColor = UIColor.darkGray
            }
        }

    }

    @IBAction func eGameBtnTapped(_ sender: UIButton) {
    
        UIView.animate(withDuration: 0.3) {
            self.eGameBtn.setTitleColor(UIColor.THGreen, for: .normal)
            self.sportBtn.setTitleColor(UIColor.white, for: .normal)
            self.mainSegBotViewLeadingConstraint.constant = 18
            self.mainSegBottomView.layoutIfNeeded()
        }
        
    }
    
    @IBAction func sportBtnTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            self.sportBtn.setTitleColor(UIColor.THGreen, for: .normal)
            self.eGameBtn.setTitleColor(UIColor.white, for: .normal)
            self.mainSegBotViewLeadingConstraint.constant = 82
            self.mainSegBottomView.layoutIfNeeded()
         }
    }
    
    @IBAction func menuFilterBtnTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMainFilter", sender: self)
    }
    
    
    @IBAction func menuSpecialOfferBtnTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMainSpecialOffer", sender: self)
        
    }
    
    
    @IBAction func menuOrderRecordBtnTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMainOrderRecord", sender: self)
        
//        let orderRecordVC = self.storyboard?.instantiateViewController(identifier: "MainOrderRecord") as! MainOrderRecordViewController
//
//         self.navigationController?.pushViewController(orderRecordVC, animated: true)
        
    }
    
    
    
//REMARK: Prepare Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toMember":
            print("prepare toMemeber")
        case "toMainFilter":
            print("prepare toMainFilter")
        case "toMainSpecialOffer":
            print("prepare toMainSpecialOffer")
        case "toMainOrderRecord":
            print("prepare toMainOrderRecord")
        default:
            break
        }
    }

}

//REMARK: Functions
extension MainViewController {
    
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
            
            //pre selection
            if indexPath.row == 0 {
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
                cell.isSelected = true
            }
            
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



//REMARK: UITableView delegate/Data
extension MainViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainBottomtableViewData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mainBottomtableViewData[section].open == true {
              return mainBottomtableViewData[section].sectionData.count + 1
          } else {
              return 1
          }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainBottomTableViewTitleCell", for: indexPath) as? MainBottomTableViewTitleCell else {
                return UITableViewCell()
            }
            
            cell.cellTitleLabel.text = mainBottomtableViewData[indexPath.section].title
            if mainBottomtableViewData[indexPath.section].open == true, let imgView = cell.upDownImage {
                imgView.image = UIImage(named: "cardOpenWhite")
            } else if let imgView = cell.upDownImage {
                imgView.image = UIImage(named: "cardCloseWhite")
            }
            
            return cell
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainBottomTableViewContentCell", for: indexPath) as? MainBottomTableViewContentCell else {
                    return UITableViewCell()
                }
            
//            cell.cellLabel.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 38
        } else {
            return 350
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
                    
                switch mainBottomtableViewData[indexPath.section].open {
                case true:
                    // if it's openned than close it
                    mainBottomtableViewData[indexPath.section].open = false
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                case false:
                    // if it's closed than open it
                      mainBottomtableViewData[indexPath.section].open = true
                      let sections = IndexSet.init(integer: indexPath.section)
                      tableView.reloadSections(sections, with: .none)
                }
                    
        } else {
                self.mainBottomTable.isUserInteractionEnabled = false
                    
        }
    }
    
}


//REMARK: ScrollView Delegate

extension MainViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        UIView.animate(withDuration: 0.15) {
            self.bottomMenuBar.alpha = 0.3
            self.menuBtn.alpha = 0.3
        }
        
        if (scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.height) {
            //bottom
            self.returnTopBtnBottomConstraint.constant = 34
        }

        if scrollView.contentOffset.y <= 1 {
            //top
            self.bottomMenuBar.alpha = 1
            self.menuBtn.alpha = 1
            self.returnTopBtnBottomConstraint.constant = -94

        }
        
        if scrollView.contentOffset.y > 1 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.height) {
            //scrolling
            
            self.returnTopBtnBottomConstraint.constant = -94
            
        }
        //under developing ==== V
//        var constant:CGFloat = -94.0
//        let offsetValue = (scrollViewlastContentOffset * 0.5)
//
//        if (self.scrollViewlastContentOffset > scrollView.contentOffset.y) {
//            print("up")
//            //火箭圖 constant 越來越接近-94
//
//            if constant > -94 {
//                constant = constant - offsetValue
////                self.returnTopBtnBottomConstraint.constant = constant
//            } else {
//                constant = -94
////                self.returnTopBtnBottomConstraint.constant = constant
//            }
//
//            print(constant)
//
//        } else if (self.scrollViewlastContentOffset < scrollView.contentOffset.y) {
//            print("down")
//
//            //火箭圖 constant 越來越大 接近34
//            if constant < 34 {
//                constant = constant + offsetValue
//            } else {
//                constant = 34
//            }
//
//            print(constant)
//        }
//
//
//        self.scrollViewlastContentOffset = scrollView.contentOffset.y
        //under developing ====
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        UIView.animate(withDuration: 0.15) {
            self.bottomMenuBar.alpha = 1
            self.menuBtn.alpha = 1
        }
        
    }
    
}
