//
//  GmaeLogic.swift
//  21poker
//
//  Created by Kenny on 2020/12/11.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//
import Foundation
import GameplayKit

protocol GameLogicDelegate: AnyObject {
    func didGetEmeryFirstArrayNumber(number: Int)
    func didGetPlaceUsedData(playerUsed: Int, playScore: Int)
}
class GameLogic {
    // MARK: - Property
    private lazy var model: CardModel = {
        let cardModel = CardModel()
        return cardModel
    }()
    
    weak var delegate: GameLogicDelegate?
    
    private lazy var pokerDeck = [PokerType]()
    
    // 莊家目前點數
    private lazy var emeryScore = 0
    private lazy var emeryFirstArrayNumber = 0
    // 莊家目前放到第幾格了
    private lazy var emeryImagePlaceUsed = 0
    private lazy var emeryGetAceCount = 0
    
    // 玩家目前點數
    private lazy var playerScore = 0
    private lazy var playerGetAceCount = 0
    // 玩家目前放到第幾格了
    private lazy var playerPlaceUsed = 0
    
    // MARK: - Method
    /// model拿 deck資料
    func setPokerDeck() {
        self.pokerDeck = model.requestData()
        print("pokerDeck \(pokerDeck)")
    }
    
    func start() {
        let numberArray = pokerDeck.map{ $0.pokerNumber }
        let randomNumber = numberArray.shuffled()
        let firstRandomNumber = randomNumber.first ?? 0
        let randomCard = pokerDeck[firstRandomNumber]
        
        for i in 0...3 {
            if i == 0 {
                emeryScore = emeryScore + randomCard.pokerNumber
                emeryFirstArrayNumber = emeryScore
                if emeryScore == 1 {
                    emeryGetAceCount = emeryGetAceCount + 1
                    
                }
                emeryImagePlaceUsed = emeryImagePlaceUsed + 1
                delegate?.didGetEmeryFirstArrayNumber(number: i)
            } else if i == 1 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                if randomCard.pokerNumber == 1 {
                    playerGetAceCount = playerGetAceCount + 1
                }
                delegate?.didGetEmeryFirstArrayNumber(number: i)
            } else if i == 2 {
                emeryScore = emeryScore + randomCard.pokerNumber
                emeryImagePlaceUsed = emeryImagePlaceUsed + 1
                if randomCard.pokerNumber == 1 {
                    emeryGetAceCount = emeryGetAceCount + 1
                }
                delegate?.didGetEmeryFirstArrayNumber(number: i)
            } else if i == 3 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                if randomCard.pokerNumber == 1 {
                    playerGetAceCount = playerGetAceCount + 1
                }
                delegate?.didGetEmeryFirstArrayNumber(number: i)
            }
            
        }
    }
    /// Hit方法
    func hit() {
        if playerPlaceUsed == 5 && playerPlaceUsed < 22 {
            delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, playScore: playerScore)
        } else {
            let numberArray = pokerDeck.map{ $0.pokerNumber }
            let randomNumber = numberArray.shuffled()
            let firstRandomNumber = randomNumber.first ?? 0
            let randomCard = pokerDeck[firstRandomNumber]
            
            if playerPlaceUsed == 2 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, playScore: playerScore)
            } else if playerPlaceUsed == 3 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, playScore: playerScore)
            } else if playerPlaceUsed == 4 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, playScore: playerScore)
            }
        }
    }
    
    /// Stand方法
    func stand() {
        while true {
            if playerScore < 13 && playerGetAceCount > 0 {
                playerGetAceCount = playerGetAceCount - 1
                playerScore = playerScore - 1 + 10
            } else {
                break
            }
        }
        var tempEmeryScore = 0
        var tempEmeryGetAceCount = 0
        let temp3 = pokerDeck[emeryFirstArrayNumber]
        while true {
            tempEmeryScore = emeryScore
            tempEmeryGetAceCount = emeryGetAceCount
            
            if emeryScore < 22 && emeryImagePlaceUsed == 5 {
            } else {
                while true {
                    if tempEmeryScore < 13 && tempEmeryGetAceCount > 0 {
                        tempEmeryGetAceCount = tempEmeryGetAceCount - 1
                        tempEmeryScore = tempEmeryScore - 1 + 10
                    } else {
                        break
                    }
                }
                if emeryScore > 16 && emeryScore < 22 {
                    if emeryScore >= playerScore {
                        
                    }
                }
            }
        }
    }
    
    // MARK: - Return Method
    /// 回傳牌面
    func returnCardName() -> PokerType {
        let numberArray = pokerDeck.map{ $0.pokerNumber }
        let randomNumber = numberArray.shuffled()
        let firstRandomNumber = randomNumber.first ?? 0
        let randomPoker = pokerDeck[firstRandomNumber]
        
        print("randomPoker \(randomPoker)")
        return randomPoker
    }
    
}
