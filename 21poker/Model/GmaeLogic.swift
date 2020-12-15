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
    func didGetPlaceUsedData(playerUsed: Int, score: Int)
    func didUpdateUserCards(cards: [PokerType])
    func didUpdateEmeryCards(cards: [PokerType])
    func didReceivePlayerScore(score: Int)
    func didReceiveEmeryScore(score: Int)
}
class GameLogic {
    // MARK: - Property
    private lazy var model: CardModel = {
        let cardModel = CardModel()
        return cardModel
    }()
    
    weak var delegate: GameLogicDelegate?
    
    private lazy var pokerDeck = [PokerType]()
    
    private lazy var userCards = [PokerType]() {
        didSet {
            updateUserScore(cards: self.userCards)
            delegate?.didUpdateUserCards(cards: self.userCards)
        }
    }
    
    private lazy var emeryCards = [PokerType]() {
        didSet {
            updateEmeryScore(cards: self.emeryCards)
            delegate?.didUpdateEmeryCards(cards: self.emeryCards)
        }
    }
    
    // 莊家目前點數
    private lazy var emeryScore = 0
    private lazy var emeryTotalNumber = 0
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
    
    /// 取得使用者第一組
    private func getUserFirstCars(deck: [PokerType]) -> [PokerType] {
        
        return [deck[0], deck[2]]
    }
    
    /// 取得敵人第一組
    private func getEmeryFirstCars(deck: [PokerType]) -> [PokerType] {
        return [deck[1], deck[3]]
    }
    
    /// 更新使用者分數
    private func updateUserScore(cards: [PokerType]) {
        for cardScore in cards {
            playerScore = playerScore + cardScore.pokerNumber
            
        }
        delegate?.didReceivePlayerScore(score: playerScore)
    }
    
    /// 更新敵人分數
    private func updateEmeryScore(cards: [PokerType]) {
        for cardScore in cards {
            emeryScore = emeryScore + cardScore.pokerNumber
        }
        delegate?.didReceiveEmeryScore(score: emeryScore)
    }
    
    func start() {
        
        let shuffledDeck = pokerDeck.shuffled()
        
        userCards = getUserFirstCars(deck: shuffledDeck)

        emeryCards = getEmeryFirstCars(deck: shuffledDeck)
        

    }
    /// Hit方法
    func hit() {
        if playerPlaceUsed == 5 && playerPlaceUsed < 22 {
            print("PlayerScore \(playerScore)")
            delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, score: playerScore)
        } else {
            let numberArray = pokerDeck.map{ $0.pokerNumber }
            let randomNumber = numberArray.shuffled()
            let firstRandomNumber = randomNumber.first ?? 0
            let randomCard = pokerDeck[firstRandomNumber]
            
            if playerPlaceUsed == 2 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                print("PlayerScore \(playerScore)")
                delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, score: playerScore)
            } else if playerPlaceUsed == 3 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                print("PlayerScore \(playerScore)")
                delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, score: playerScore)
            } else if playerPlaceUsed == 4 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                print("PlayerScore \(playerScore)")
                delegate?.didGetPlaceUsedData(playerUsed: playerPlaceUsed, score: playerScore)
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
        let temp3 = pokerDeck[emeryTotalNumber]
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
