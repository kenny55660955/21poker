//
//  ViewController.swift
//  21poker
//
//  Created by Kenny on 2020/1/7.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Property
    @IBOutlet weak var userStart: UIButton!
    @IBOutlet weak var userHit: UIButton!
    @IBOutlet weak var userStand: UIButton!
    @IBOutlet weak var userReplay: UIButton!
    /// 我方卡片放置區
    @IBOutlet weak var playerPlace01: UIImageView!
    @IBOutlet weak var playerPlace02: UIImageView!
    @IBOutlet weak var playerPlace03: UIImageView!
    @IBOutlet weak var playerPlace04: UIImageView!
    @IBOutlet weak var playerPlace05: UIImageView!
    /// 敵方卡片放置區
    @IBOutlet weak var emeryPlace01: UIImageView!
    @IBOutlet weak var emeryPlace02: UIImageView!
    @IBOutlet weak var emeryPlace03: UIImageView!
    @IBOutlet weak var emeryPlace04: UIImageView!
    @IBOutlet weak var emeryPlace05: UIImageView!
    
    /// 結果標題
    @IBOutlet weak var labPlayResult: UILabel!
    
    //敵方陣營
    @IBOutlet weak var image_emery_back01: UIImageView!
    @IBOutlet weak var image_emery_back02: UIImageView!
    @IBOutlet weak var image_emery_back03: UIImageView!
    @IBOutlet weak var image_emery_back04: UIImageView!
    @IBOutlet weak var image_emery_back05: UIImageView!
    
    //我方陣營
    @IBOutlet weak var image_player_back01: UIImageView!
    @IBOutlet weak var image_player_back02: UIImageView!
    @IBOutlet weak var image_player_back03: UIImageView!
    @IBOutlet weak var image_player_back04: UIImageView!
    @IBOutlet weak var image_player_back05: UIImageView!
    
    lazy var gameLogic: GameLogic = {
        let logic = GameLogic()
        logic.delegate = self
        return logic
    }()
    
//    private var i: Int? = nil
    
//    private lazy var emeryScore = 0
//    private lazy var emeryFirstArrayNumber = 0
//    private lazy var emeryImagePlaceUsed = 0
//    private lazy var emeryGetAceCount = 0
//    private lazy var playerScore = 0
//    private lazy var playerGetAceCount = 0
//    private lazy var playerPlaceUsed = 0

    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getPokerData()
        setupAlpha()
        setupUI()
    }
    
    // MARK: - UI Method
    private func setupUI() {
        labPlayResult.text = ""
    }
    
    private func setupAlpha() {
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
        userReplay.isUserInteractionEnabled = false
        userReplay.alpha = 0.5
        
        image_emery_back01.alpha = 0
        image_emery_back02.alpha = 0
        image_emery_back03.alpha = 0
        image_emery_back04.alpha = 0
        image_emery_back05.alpha = 0
        
        image_player_back01.alpha = 0
        image_player_back02.alpha = 0
        image_player_back03.alpha = 0
        image_player_back04.alpha = 0
        image_player_back05.alpha = 0
    }
    
    private func resetUI() {
        
        labPlayResult.text = ""
        /// 重設我方牌
        image_player_back03.image = UIImage(named: "")
        image_player_back04.image = UIImage(named: "")
        image_player_back05.image = UIImage(named: "")
        /// 重設莊家牌
        image_emery_back03.image = UIImage(named: "")
        image_emery_back04.image = UIImage(named: "")
        image_emery_back05.image = UIImage(named: "")
        
        
        userHit.isUserInteractionEnabled = true
        userHit.alpha = 1
        
        userStand.isUserInteractionEnabled = true
        userStand.alpha = 1
        
        userReplay.isUserInteractionEnabled = true
        userReplay.alpha = 1
        
        userStart.isUserInteractionEnabled = false
        userStart.alpha = 0
    }
    
    // MARK: - 取得資料
    private func getPokerData() {
        gameLogic.setPokerDeck()
    }
    
    // MARK: - 功能方法
    
    private func start(){
       gameLogic.start()
    }
    /// 叫牌
    private func hit() {
        gameLogic.hit()
    }
    /// 停牌
    private func stand() {
        gameLogic.stand()
    }
    private func resetLogic() {
        gameLogic.reset()
    }
   
    // MARK: - 按鈕功能
    //Start按鈕
    @IBAction func userStartPlay(_ sender: Any) {
        resetUI()
        start()
    }
    
    //HIT按鈕
    @IBAction private func playHit(_ sender: Any) {
        hit()
    }
    
    //STAND按鈕
    @IBAction private func btnUserStand(_ sender: Any) {
        stand()
    }
    
    //Replay按鈕
    @IBAction private func btnUserReplay(_ sender: Any) {
        resetLogic()
        resetUI()
        start()
    }
}
// MARK: - Logic Delegate 傳資料過來
extension ViewController: GameLogicDelegate {
    
    func didReceiveBankerBJ() {
        labPlayResult.text = "Black Jack"
        let controller  = UIAlertController(title: "",message: "OK", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
        
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
    }
    
    func didReceiveUserBJ() {
        labPlayResult.text = "Black Jack"
        let controller  = UIAlertController(title: "",message: "OK", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
        
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
    }
    
    
    func didReceiveTie() {
        labPlayResult.text = "Tie"
        let controller  = UIAlertController(title: "雙方點數相同",message: "OK", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
        
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
    }
    
    
    func didReceiveBankerLost() {
        let score = gameLogic.emeryScore
        labPlayResult.text = "☠Banker BUSTED!!!☠ "
        let controller  = UIAlertController(title: "You Win \n BankerScore: \(score)",message: "OK", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
        
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
    }
    
    func didReceiveUserLost() {
        
        let score = gameLogic.playerScore
        
        labPlayResult.text = "☠BUSTED!!!☠ "
        let controller  = UIAlertController(title: "☠LOSE☠",message: "☠BUSTED Point: \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "😤", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
        
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
    }
    
    func didReceivePlayerScore(score: Int) {
        //TODO: update UI
        print("CurrentPlayerScore: \(score)")
        
    }
    
    func didReceiveEmeryScore(score: Int) {
        // TODO update UI
        print("CurrentEmeryScore: \(score)")
        
        
    }
    
    
    func didUpdateUserCards(cards: [PokerType]) {
        
        print("user update cards: \(cards)")
        let firstImage = cards[0].image
        let secondImage = cards[1].image
        let count = cards.count
        print("Count\(count)")
        if count == 2 {
            image_player_back01.image = UIImage(named: firstImage)
            image_player_back02.image = UIImage(named: secondImage)
            image_player_back01.alpha = 1
            image_player_back02.alpha = 1
        } else if count == 3 {
            let thirdImage = cards[2].image
            image_player_back03.image = UIImage(named: thirdImage)
            image_player_back03.alpha = 1
        } else if count == 4{
            let thirdImage = cards[3].image
            image_player_back04.image = UIImage(named: thirdImage)
            image_player_back04.alpha = 1
        } else if count == 5 {
            let thirdImage = cards[4].image
            image_player_back05.image = UIImage(named: thirdImage)
            image_player_back05.alpha = 1
        }
        
        
    }
    
    func didUpdateEmeryCards(cards: [PokerType]) {
        
        print("Dealer update cards: \(cards)")
        let secondImage = cards[1].image
        /// 莊家第一張牌都是暗牌
        image_emery_back01.image = UIImage(named: "cardBackStyle")
        image_emery_back02.image = UIImage(named: secondImage)
        
        image_emery_back01.alpha = 1
        image_emery_back02.alpha = 1
    }
}
