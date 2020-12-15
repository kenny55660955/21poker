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
    func didUpdateUserCards(cards: [PokerType])
    func didUpdateEmeryCards(cards: [PokerType])
    func didReceivePlayerScore(score: Int)
    func didReceiveEmeryScore(score: Int)
    func didReceiveUserLost()
    func didReceiveBankerLost()
    func didReceiveTie()
    func didReceiveBankerBJ()
    func didReceiveUserBJ()
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
    private(set) lazy var emeryScore = 0
    private lazy var emeryTotalNumber = 0
    // 莊家目前放到第幾格了
    private lazy var emeryImagePlaceUsed = 0
    private lazy var emeryGetAceCount = 0
    
    // 玩家目前點數
    private(set) lazy var playerScore = 0
    private lazy var playerGetAceCount = 0
    // 玩家目前放到第幾格了
    private lazy var playerPlaceUsed = 0
    
    private var nextCardIndex = 0
    
    private let cardLimit = 5
    
    private let pointLimit = 21
    
    // MARK: - Method
    
    func reset() {
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
            nextCardIndex = nextCardIndex + 1
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
        
        checkUserPoint()
    }
    
    private func checkUserPoint() {
      
        if playerScore > pointLimit {
            delegate?.didReceiveUserLost()
        }
    }
    
    /// 更新敵人分數
    private func updateEmeryScore(cards: [PokerType]) {
        
        var score = 0
        
        for cardScore in cards {
            score += cardScore.pokerNumber
        }
        emeryScore = score
        print("Current : \(emeryScore)")
        delegate?.didReceiveEmeryScore(score: emeryScore)
        
        checkBankerPoint()
        
        bankerGetNextCardIfNeeded()
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
        
        /// 如果滿五張牌就直接return
        userCards.append(poker)
        if userCards.count == cardLimit {
            startBankerRound()
        } else if playerScore == pointLimit {
            delegate?.didReceiveBankerLost()
        }
    }
    
    /// Stand方法
    func stand() {
        startBankerRound()
    }
    
    private func startBankerRound() {
        
        if emeryScore == pointLimit {
            calculateScore()
            return
        } else if emeryCards.count == cardLimit {
            calculateScore()
            return
        } else if emeryScore >= playerScore {
            calculateScore()
            return
        } else if emeryScore < playerScore {
           emeryGetCard()
            return
        }
    }
    
    private func checkBankerPoint() {
        if emeryScore > pointLimit {
            delegate?.didReceiveUserLost()
        }
    }
    
    private func emeryGetCard()  {
        guard let poker = getCard() else { return }
        emeryCards.append(poker)
    }
    
    private func bankerGetNextCardIfNeeded()  {
        if emeryCards.count < cardLimit && emeryScore < playerScore {
            emeryGetCard()
        }
    }
    
    private func calculateScore() {
        // user score
        // banker score
        
        if emeryScore == pointLimit {
            delegate?.didReceiveBankerBJ()
        }
        
        if playerScore == emeryScore {
            if playerScore == pointLimit && emeryScore == pointLimit {
                delegate?.didReceiveTie()
            } else {
                delegate?.didReceiveUserLost()
            }
        }
        
        if playerScore > emeryScore {
            delegate?.didReceiveBankerLost()
        } else if playerScore < emeryScore {
            delegate?.didReceiveUserLost()
        } else if playerScore == pointLimit {
            delegate?.didReceiveUserBJ()
        }
    }
}
