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
        
        return logic
    }()
    
    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getPokerData()
        
        
        
    
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
    
    // MARK: - getData
    private func getData() {
        gameLogic.getDeck()
    }
    
    private func changeCardsAlpha() {
        /// 顯示按鈕
        userHit.isUserInteractionEnabled = true
        userHit.alpha = 1
        
        /// 顯示Stand
        userStand.isUserInteractionEnabled = true
        userStand.alpha = 1
        
        /// 顯示Hit
        userReplay.isUserInteractionEnabled = true
        userReplay.alpha = 1
        
        /// 隱藏Start
        userStart.isUserInteractionEnabled = false
        userStart.alpha = 0
    }
    
    /// 重製卡片狀態
    private func replay() {
        
        gameLogic.replay()
        
        labPlayResult.text = ""
        
        emeryPlace01.image = UIImage(named: "")
        emeryPlace02.image = UIImage(named: "")
        emeryPlace03.image = UIImage(named: "")
        emeryPlace04.image = UIImage(named: "")
        emeryPlace05.image = UIImage(named: "")
        
        playerPlace01.image = UIImage(named: "")
        playerPlace02.image = UIImage(named: "")
        playerPlace03.image = UIImage(named: "")
        playerPlace04.image = UIImage(named: "")
        playerPlace05.image = UIImage(named: "")
        
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
        gameLogic.getDeck()
    }
    // MARK: - 功能方法
    /// 開始
    private func start(){
        gameLogic.start()
    }
    /// 要牌
    private func hit() {
        gameLogic.hit()
    }
    /// 停牌
    private func stand() {
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
        
        gameLogic.stand()
    }
    
    // MARK: - 按鈕功能
    //Start按鈕
    @IBAction func userStartPlay(_ sender: Any) {
        changeCardsAlpha()
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
        replay()
        
        start()
    }
}
// MARK: - Logic Delegate 傳資料過來
