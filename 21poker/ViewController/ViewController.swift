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
    
    private var i: Int? = nil
    
    private lazy var emeryScore = 0
    private lazy var emeryFirstArrayNumber = 0
    private lazy var emeryImagePlaceUsed = 0
    private lazy var emeryGetAceCount = 0
    private lazy var playerScore = 0
    private lazy var playerGetAceCount = 0
    private lazy var playerPlaceUsed = 0

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
        labPlayResult.text = ""
        emeryScore = 0
        playerScore = 0
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
        
        emeryImagePlaceUsed = 0
        playerPlaceUsed = 0
        
        emeryGetAceCount = 0
        playerGetAceCount = 0
    }
    
    // MARK: - 取得資料
    private func getPokerData() {
        gameLogic.setPokerDeck()
    }
    
    // MARK: - 功能方法
    private func start(){
        
       gameLogic.start()
    }
    /// 每次都會去判斷卡片分數
    private func hit() {
        gameLogic.hit()
    }
//        if playerPlaceUsed == 5 && playerPlaceUsed < 22{
//            labPlayResult.text = "♛YOU WIN♛"
//
//            userHit.isUserInteractionEnabled = false
//            userHit.alpha = 0.5
//            userStand.isUserInteractionEnabled = false
//            userStand.alpha = 0.5
//
//        } else {
//            let tempNumber = randomNumber?.nextInt()
//            let temp2 = cardArray[tempNumber!]
//            if playerPlaceUsed == 2{
//                playerPlace03.image = UIImage(named: temp2.image)
//                playerScore = playerScore + temp2.pokerNumber
//                playerPlaceUsed = playerPlaceUsed + 1
//            }else if playerPlaceUsed == 3{
//                playerPlace04.image = UIImage(named: temp2.image)
//                playerScore = playerScore + temp2.pokerNumber
//                playerPlaceUsed = playerPlaceUsed + 1
//            }else if playerPlaceUsed == 4{
//                playerPlace05.image = UIImage(named: temp2.image)
//                playerScore = playerScore + temp2.pokerNumber
//                playerPlaceUsed = playerPlaceUsed + 1
//            }
//        }
//
//        if playerScore > 21{
//            labPlayResult.text = "☠BUSTED!!!☠ "
//            let controller  = UIAlertController(title: "☠LOSE☠",message: "☠BUSTED!!!☠", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "😤", style: .default, handler: nil)
//            controller.addAction(okAction)
//            present(controller, animated: true, completion: nil)
//
//            userHit.isUserInteractionEnabled = false
//            userHit.alpha = 0.5
//            userStand.isUserInteractionEnabled = false
//            userStand.alpha = 0.5
//        }
//        if playerScore == 21{
//            labPlayResult.text = """
//                                BLACKJACK!!!!
//                                ♛YOU WIN♛
//                            """
//            let controller  = UIAlertController(title: "♛WIN♛",message: "Congratulations!!", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "😎", style: .default, handler: nil)
//            controller.addAction(okAction)
//            present(controller, animated: true, completion: nil)
//
//            userHit.isUserInteractionEnabled = false
//            userHit.alpha = 0.5
//            userStand.isUserInteractionEnabled = false
//            userStand.alpha = 0.5
//        }
//    }
//
    private func stand() {
        gameLogic.stand()
    }
//        userHit.isUserInteractionEnabled = false
//        userHit.alpha = 0.5
//        userStand.isUserInteractionEnabled = false
//        userStand.alpha = 0.5
//
//        while true{
//            if playerScore < 13 && playerGetAceCount > 0{
//                playerGetAceCount = playerGetAceCount - 1
//                playerScore = playerScore - 1 + 10
//            }else{
//                break
//
//            }
//        }
//        var tempEmeryScore = 0
//        var tempEmeryGetAceCount = 0
//        let temp3 = cardArray[emeryFirstArrayNumber]
//        while true{
//            tempEmeryScore = emeryScore
//            tempEmeryGetAceCount = emeryGetAceCount
//
//            if emeryScore < 22 && emeryImagePlaceUsed == 5{
//                let str = String(emeryScore)
//                labPlayResult.text = "☠YOU LOSE!!☠"
//                let controller  = UIAlertController(title: "☠LOSE☠",message: "emeryNumber" + str, preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "😤", style: .default, handler: nil)
//                controller.addAction(okAction)
//                present(controller, animated: true, completion: nil)
//
//
//                emeryPlace01.image = UIImage(named: temp3.image)
//                break
//            }else{
//                while true{
//                    if tempEmeryScore < 13 && tempEmeryGetAceCount > 0{
//                        tempEmeryGetAceCount = tempEmeryGetAceCount - 1
//                        tempEmeryScore = tempEmeryScore - 1 + 10
//                    }else{
//                        break
//
//                    }
//                }
//                let tempNumber = randomNumber?.nextInt()
//                let temp2 = cardArray[tempNumber!]
//                if tempEmeryScore > emeryScore && tempEmeryScore > 16 && tempEmeryScore < 22{
//                    emeryScore = tempEmeryScore
//                }
//                if emeryScore > 16 && emeryScore < 22{
//                    if  emeryScore >= playerScore{
//                        labPlayResult.text = "☠YOU LOSE!!☠"
//
//                        emeryPlace01.image = UIImage(named: temp3.image)
//                        break
//                    }else{
//                        labPlayResult.text = "♛YOU WIN♛"
//                        emeryPlace01.image = UIImage(named: temp3.image)
//                        break
//                    }
//                }
//                else{
//                    if emeryImagePlaceUsed == 2{
//                        emeryPlace03.image = UIImage(named: temp2.image)
//                        emeryScore = emeryScore + temp2.pokerNumber
//                        emeryImagePlaceUsed = emeryImagePlaceUsed + 1
//                        if temp2.pokerNumber == 1{
//                            emeryGetAceCount = emeryGetAceCount + 1
//                        }
//                    }else if emeryImagePlaceUsed == 3{
//                        emeryPlace04.image = UIImage(named: temp2.image)
//                        emeryScore = emeryScore + temp2.pokerNumber
//                        emeryImagePlaceUsed = emeryImagePlaceUsed + 1
//                        if temp2.pokerNumber == 1{
//                            emeryGetAceCount = emeryGetAceCount + 1
//                        }
//                    }else if emeryImagePlaceUsed == 4{
//                        emeryPlace05.image = UIImage(named: temp2.image)
//                        emeryScore = emeryScore + temp2.pokerNumber
//                        emeryImagePlaceUsed = emeryImagePlaceUsed + 1
//                        if temp2.pokerNumber == 1{
//                            emeryGetAceCount = emeryGetAceCount + 1
//                        }
//
//                    }
//                    if emeryScore == 21{
//                        labPlayResult.text = """
//                                                BLACK JACK!!!
//                                                ☠YOU LOSE!!☠
//                                                """
//                        emeryPlace01.image = UIImage(named: temp3.image)
//                        break
//                    }
//                    if emeryScore > 21{
//                        labPlayResult.text = "♛YOU WIN♛"
//                        emeryPlace01.image = UIImage(named: temp3.image)
//                        break
//
//                    }
//
//                }
//            }
//        }
//    }
    
   
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
extension ViewController: GameLogicDelegate {

    func didGetEmeryFirstArrayNumber(number: Int) {
        let poker = gameLogic.returnCardName()
        if number == 0 {
            emeryPlace01.image = UIImage(named: "cardStyle")
        } else if number == 1 {
            playerPlace01.image = UIImage(named: poker.image)
            image_emery_back02.alpha = 1
        } else if number == 2 {
            emeryPlace02.image = UIImage(named: poker.image)
        } else if number == 3 {
            playerPlace02.image = UIImage(named: poker.image)
        }
    }
}
