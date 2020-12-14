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
}
class GameLogic {
    // MARK: - Property
    private lazy var model: CardModel = {
        let cardModel = CardModel()
        return cardModel
    }()
    
    weak var delegate: GameLogicDelegate?
    
    private lazy var pokerDeck = [PokerType]()
    
    private var randomNumber: GKShuffledDistribution?
    private lazy var emeryScore = 0
    private lazy var emeryFirstArrayNumber = 0
    private lazy var emeryImagePlaceUsed = 0
    private lazy var emeryGetAceCount = 0
    private lazy var playerScore = 0
    private lazy var playerGetAceCount = 0
    private lazy var playerPlaceUsed = 0
    
    // MARK: - Method
    /// model拿 deck資料
    func setPokerDeck() {
        self.pokerDeck = model.requestData()
    }
    
    // 開始，會回傳三張牌， 我方兩張 對方一張
    func start() {
        let firstRandomNumber = randomNumber?.nextInt() ?? 0
        let randomCard = pokerDeck[firstRandomNumber]
        randomNumber = GKShuffledDistribution(lowestValue: 0, highestValue: pokerDeck.count - 1)
        for i in 0...3 {
            if i == 0 {
                emeryScore = emeryScore + randomCard.pokerNumber
                emeryFirstArrayNumber = emeryScore
                if emeryScore == 1 {
                    
                    emeryGetAceCount = emeryGetAceCount + 1
                }
                emeryImagePlaceUsed = emeryImagePlaceUsed + 1
            } else if i == 1 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                if randomCard.pokerNumber == 1 {
                    playerGetAceCount = playerGetAceCount + 1
                }
            } else if i == 2 {
                emeryScore = emeryScore + randomCard.pokerNumber
                emeryImagePlaceUsed = emeryImagePlaceUsed + 1
                if randomCard.pokerNumber == 1 {
                    emeryGetAceCount = emeryGetAceCount + 1
                }
            } else if i == 3 {
                playerScore = playerScore + randomCard.pokerNumber
                playerPlaceUsed = playerPlaceUsed + 1
                if randomCard.pokerNumber == 1 {
                    playerGetAceCount = playerGetAceCount + 1
                }
            }
            delegate?.didGetEmeryFirstArrayNumber(number: i)
        }
    }
    /// Hit方法
    func hit() { }
    
    /// Stand方法
    func stand() { }
    
    // MARK: - Return Method
    /// 回傳牌面
    func returnCardName() -> PokerType {
        let randomPoker = pokerDeck[randomNumber?.nextInt() ?? 0]
        print("randomPoker \(randomPoker)")
        return randomPoker
    }
    
}
