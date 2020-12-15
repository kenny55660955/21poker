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
//    func didGetEmeryFirstArrayNumber(number: Int)
//    func didGetPlaceUsedData(playerUsed: Int, score: Int)
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
    
    private var nextCardIndex = 0
    
    // MARK: - Method
    
    func replay() {
        // 莊家目前點數
        emeryScore = 0
        emeryTotalNumber = 0
        // 莊家目前放到第幾格了
        emeryImagePlaceUsed = 0
        emeryGetAceCount = 0
        
        // 玩家目前點數
        playerScore = 0
        playerGetAceCount = 0
        // 玩家目前放到第幾格了
        playerPlaceUsed = 0
        
        nextCardIndex = 0
    }
    
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
    
    private func getCard() -> PokerType? {
        
        if pokerDeck.indices.contains(nextCardIndex) {
            let card = pokerDeck[nextCardIndex]
            return card
        }
        
        return nil
    }
    
    /// 更新使用者分數
    private func updateUserScore(cards: [PokerType]) {
        
        var score = 0
        
        for cardScore in cards {
            score += cardScore.pokerNumber
        }
        playerScore = score
        delegate?.didReceivePlayerScore(score: playerScore)
    }
    
    /// 更新敵人分數
    private func updateEmeryScore(cards: [PokerType]) {
        
        var score = 0
        
        for cardScore in cards {
            score += cardScore.pokerNumber
        }
        emeryScore = score
        delegate?.didReceiveEmeryScore(score: emeryScore)
    }
    
    private func resetCardIndex() {
        nextCardIndex = 4
    }
    
    func start() {
        
        let shuffledDeck = pokerDeck.shuffled()
        
        userCards = getUserFirstCars(deck: shuffledDeck)

        emeryCards = getEmeryFirstCars(deck: shuffledDeck)
        
        resetCardIndex()
    }
    /// Hit方法
    func hit() {
        
        guard let poker = getCard() else { return }
        
        nextCardIndex = nextCardIndex + 1
        /// 如果滿五張牌就直接return
        userCards.append(poker)
        if userCards.count == 5 {
            return
        }
    }
    
    /// Stand方法
    func stand() {
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
