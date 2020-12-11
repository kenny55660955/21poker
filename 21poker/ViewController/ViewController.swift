//
//  ViewController.swift
//  21poker
//
//  Created by Kenny on 2020/1/7.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import UIKit
import GameplayKit

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
    
    /// 所有卡片
    var cardArray =
        [PokerType(pokerNumber: 1, image: "ace_of_spades", porkerFlower: 4), PokerType(pokerNumber: 2, image: "2_of_spades", porkerFlower: 4), PokerType(pokerNumber: 3, image: "3_of_spades", porkerFlower: 4), PokerType(pokerNumber: 4, image: "4_of_spades", porkerFlower: 4),PokerType(pokerNumber: 5, image: "5_of_spades", porkerFlower: 4),PokerType(pokerNumber: 6, image: "6_of_spades", porkerFlower: 4),PokerType(pokerNumber: 7, image: "7_of_spades", porkerFlower: 4),PokerType(pokerNumber: 8, image: "8_of_spades", porkerFlower: 4),PokerType(pokerNumber: 9, image: "9_of_spades", porkerFlower: 4),PokerType(pokerNumber: 10, image: "10_of_spades", porkerFlower: 4),PokerType(pokerNumber: 10, image: "jack_of_spades", porkerFlower: 4),PokerType(pokerNumber: 10, image: "king_of_spades", porkerFlower: 4),PokerType(pokerNumber: 10, image: "queen_of_spades", porkerFlower: 4),//以上黑桃
         PokerType(pokerNumber: 1, image: "ace_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 2, image: "2_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 3, image: "3_of_clubs", porkerFlower: 3),PokerType(pokerNumber: 4, image: "4_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 5, image: "5_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 6, image: "6_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 7, image: "7_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 8, image: "8_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 9, image: "9_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 10, image: "10_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 10, image: "jack_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 10, image: "queen_of_hearts", porkerFlower: 3),PokerType(pokerNumber: 10, image: "king_of_hearts", porkerFlower: 3),//以上愛心
         PokerType(pokerNumber: 1, image: "ace_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 2, image: "2_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 3, image: "3_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 4, image: "4_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 5, image: "5_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 6, image: "6_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 7, image: "7_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 8, image: "8_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 9, image: "9_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 10, image: "10_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 10, image: "jack_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 10, image: "queen_of_diamonds", porkerFlower: 2),PokerType(pokerNumber: 10, image: "king_of_diamonds", porkerFlower: 2),//以上方塊
         PokerType(pokerNumber: 1, image: "ace_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 2, image: "2_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 3, image: "3_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 4, image: "4_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 5, image: "5_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 6, image: "6_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 7, image: "7_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 8, image: "8_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 9, image: "9_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 10, image: "10_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 11, image: "jack_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 12, image: "queen_of_clubs", porkerFlower: 1),PokerType(pokerNumber: 13, image: "king_of_clubs", porkerFlower: 1),]//以上梅花
    
    var emeryScore = 0
    var playerScore = 0
    var emeryFirstArrayNumber = 0
    var emeryImagePlaceUsed = 0
    var emeryGetAceCount = 0
    var playerPlaceUsed = 0
    var playerGetAceCount = 0
    var isOpen = false
    var randomNumber: GKShuffledDistribution?
    
    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAlpha()
        setupUI()
    }
    
    // MARK: - UI Method
    
    private func setupUI() {
        randomNumber = GKShuffledDistribution(lowestValue: 0, highestValue: cardArray.count-1)
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
        userHit.isUserInteractionEnabled = true
        userHit.alpha = 1
        
        userStand.isUserInteractionEnabled = true
        userStand.alpha = 1
        
        userReplay.isUserInteractionEnabled = true
        userReplay.alpha = 1
        
        userStart.isUserInteractionEnabled = false
        userStart.alpha = 0
    }
    
    // MARK: - 功能方法
    private func start(){
        for i in 0...3{
            let tempNumber = randomNumber?.nextInt()
            let temp2 = cardArray[tempNumber!]
            if i == 0{
                emeryPlace01.image = UIImage(named: "emeryCardBack")
                emeryScore = emeryScore + temp2.pokerNumber
                emeryFirstArrayNumber = emeryScore
                if emeryScore == 1{
                    emeryGetAceCount = emeryGetAceCount + 1
                }
                emeryImagePlaceUsed = emeryImagePlaceUsed + 1
            }else if i == 1{
                playerPlace01.image = UIImage(named: temp2.image)
                playerScore = playerScore + temp2.pokerNumber
                playerPlaceUsed = playerGetAceCount + 1
                if temp2.pokerNumber == 1{
                    playerGetAceCount = playerGetAceCount + 1
                }
                image_emery_back02.alpha = 0
            }else if i == 2{
                emeryPlace02.image = UIImage(named: temp2.image)
                emeryScore = emeryScore + temp2.pokerNumber
                emeryImagePlaceUsed = emeryImagePlaceUsed + 1
                if temp2.pokerNumber == 1{
                    emeryGetAceCount = emeryGetAceCount + 1
                }
            }else if i == 3{
                playerPlace02.image = UIImage(named: temp2.image)
                playerScore = playerScore + temp2.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                if temp2.pokerNumber == 1{
                    playerGetAceCount = playerGetAceCount + 1
                }
            }
        }
    }
    /// 每次都會去判斷卡片分數
    private func hit() {
        if playerPlaceUsed == 5 && playerPlaceUsed < 22{
            labPlayResult.text = "♛YOU WIN♛"
            
            userHit.isUserInteractionEnabled = false
            userHit.alpha = 0.5
            userStand.isUserInteractionEnabled = false
            userStand.alpha = 0.5
            
        }else{
            let tempNumber = randomNumber?.nextInt()
            let temp2 = cardArray[tempNumber!]
            if playerPlaceUsed == 2{
                playerPlace03.image = UIImage(named: temp2.image)
                playerScore = playerScore + temp2.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
            }else if playerPlaceUsed == 3{
                playerPlace04.image = UIImage(named: temp2.image)
                playerScore = playerScore + temp2.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
            }else if playerPlaceUsed == 4{
                playerPlace05.image = UIImage(named: temp2.image)
                playerScore = playerScore + temp2.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
            }
        }
        
        if playerScore > 21{
            labPlayResult.text = "☠BUSTED!!!☠ "
            let controller  = UIAlertController(title: "☠LOSE☠",message: "☠BUSTED!!!☠", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "😤", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
            
            userHit.isUserInteractionEnabled = false
            userHit.alpha = 0.5
            userStand.isUserInteractionEnabled = false
            userStand.alpha = 0.5
        }
        if playerScore == 21{
            labPlayResult.text = """
                                BLACKJACK!!!!
                                ♛YOU WIN♛
                            """
            let controller  = UIAlertController(title: "♛WIN♛",message: "Congratulations!!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "😎", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
            
            userHit.isUserInteractionEnabled = false
            userHit.alpha = 0.5
            userStand.isUserInteractionEnabled = false
            userStand.alpha = 0.5
        }
    }
    
    private func stand() {
        userHit.isUserInteractionEnabled = false
        userHit.alpha = 0.5
        userStand.isUserInteractionEnabled = false
        userStand.alpha = 0.5
        
        while true{
            if playerScore < 13 && playerGetAceCount > 0{
                playerGetAceCount = playerGetAceCount - 1
                playerScore = playerScore - 1 + 10
            }else{
                break
                
            }
        }
        var tempEmeryScore = 0
        var tempEmeryGetAceCount = 0
        let temp3 = cardArray[emeryFirstArrayNumber]
        while true{
            tempEmeryScore = emeryScore
            tempEmeryGetAceCount = emeryGetAceCount
            
            if emeryScore < 22 && emeryImagePlaceUsed == 5{
                let str = String(emeryScore)
                labPlayResult.text = "☠YOU LOSE!!☠"
                let controller  = UIAlertController(title: "☠LOSE☠",message: "emeryNumber" + str, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "😤", style: .default, handler: nil)
                controller.addAction(okAction)
                present(controller, animated: true, completion: nil)
                
                
                emeryPlace01.image = UIImage(named: temp3.image)
                break
            }else{
                while true{
                    if tempEmeryScore < 13 && tempEmeryGetAceCount > 0{
                        tempEmeryGetAceCount = tempEmeryGetAceCount - 1
                        tempEmeryScore = tempEmeryScore - 1 + 10
                    }else{
                        break
                        
                    }
                }
                let tempNumber = randomNumber?.nextInt()
                let temp2 = cardArray[tempNumber!]
                if tempEmeryScore > emeryScore && tempEmeryScore > 16 && tempEmeryScore < 22{
                    emeryScore = tempEmeryScore
                }
                if emeryScore > 16 && emeryScore < 22{
                    if  emeryScore >= playerScore{
                        labPlayResult.text = "☠YOU LOSE!!☠"
                        
                        emeryPlace01.image = UIImage(named: temp3.image)
                        break
                    }else{
                        labPlayResult.text = "♛YOU WIN♛"
                        emeryPlace01.image = UIImage(named: temp3.image)
                        break
                    }
                }
                else{
                    if emeryImagePlaceUsed == 2{
                        emeryPlace03.image = UIImage(named: temp2.image)
                        emeryScore = emeryScore + temp2.pokerNumber
                        emeryImagePlaceUsed = emeryImagePlaceUsed + 1
                        if temp2.pokerNumber == 1{
                            emeryGetAceCount = emeryGetAceCount + 1
                        }
                    }else if emeryImagePlaceUsed == 3{
                        emeryPlace04.image = UIImage(named: temp2.image)
                        emeryScore = emeryScore + temp2.pokerNumber
                        emeryImagePlaceUsed = emeryImagePlaceUsed + 1
                        if temp2.pokerNumber == 1{
                            emeryGetAceCount = emeryGetAceCount + 1
                        }
                    }else if emeryImagePlaceUsed == 4{
                        emeryPlace05.image = UIImage(named: temp2.image)
                        emeryScore = emeryScore + temp2.pokerNumber
                        emeryImagePlaceUsed = emeryImagePlaceUsed + 1
                        if temp2.pokerNumber == 1{
                            emeryGetAceCount = emeryGetAceCount + 1
                        }
                        
                    }
                    if emeryScore == 21{
                        labPlayResult.text = """
                                                BLACK JACK!!!
                                                ☠YOU LOSE!!☠
                                                """
                        emeryPlace01.image = UIImage(named: temp3.image)
                        break
                    }
                    if emeryScore > 21{
                        labPlayResult.text = "♛YOU WIN♛"
                        emeryPlace01.image = UIImage(named: temp3.image)
                        break
                        
                    }
                    
                }
            }
        }
        
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

