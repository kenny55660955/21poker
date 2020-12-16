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
    
    /// 莊家目前點數
    private(set) lazy var emeryScore = 0
    
    /// 玩家目前點數
    private(set) lazy var playerScore = 0
    
    private var nextCardIndex = 0
    
    /// 限制手牌
    private let cardLimit = 5
    
    /// 21點上限
    private let pointLimit = 21
    
    /// 如果取得Ace
    private var gotAce = 0
    
    /// 判斷目前回合 分開計算分數
    var state: GameSet = .playState
    
    // MARK: - Method
    
    func countAce() {
        
    }
    
    func reset() {
        // 莊家目前點數
        emeryScore = 0
        playerScore = 0
        
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
    /// 拿一張牌
    private func getCard() -> PokerType? {
        if pokerDeck.indices.contains(nextCardIndex) {
            
            let card = pokerDeck[nextCardIndex]
            
            
            let checkCardPoint = calculateCardPoint(card: card)
            
            switch state {
            case .playState:
                playerScore += checkCardPoint
            case .bankState:
                emeryScore += checkCardPoint
            }
            
            nextCardIndex = nextCardIndex + 1
            return card
        }
        return nil
    }
    /// 更新使用者分數
    private func updateUserScore(cards: [PokerType]) {
        state = .playState
        
        print("state \(state)")
        var score = 0
        
        for card in cards {
          let point = calculateCardPoint(card: card)
            score += point
        }
        playerScore = score
        delegate?.didReceivePlayerScore(score: playerScore)
        
        checkUserPoint()
    }
    /// 更新敵人分數
    private func updateEmeryScore(cards: [PokerType]) {
        state = .bankState
        print("state \(state)")
        var score = 0
        
        for card in cards {
            let point = calculateCardPoint(card: card)
            score += point
        }
        emeryScore = score
        
        delegate?.didReceiveEmeryScore(score: emeryScore)
        
        checkBankerPoint()
        
    }
    
    /// 判斷Ace 1 or 11 所以寫成一個方法計算完直接回傳分數
    func calculateCardPoint(card: PokerType) -> Int {
        var score = 0
        if card.pokerNumber == 1 {
            if score + 11 > pointLimit {
                score += 1
                return score
            } else {
                score += 11
                return score
            }
            
        } else {
            score += card.pokerNumber
            return score
        }
    }
    
    /// 檢查User index
    private func checkUserPoint() {
        if playerScore > pointLimit {
            delegate?.didReceiveUserLost()
        } else if playerScore == pointLimit {
            delegate?.didReceiveUserBJ()
        } else if userCards.count == cardLimit {
            delegate?.didReceiveBankerLost()
        }
    }
    
    /// 確認Banker index
    private func checkBankerPoint() {
        if emeryScore > pointLimit {
            delegate?.didReceiveBankerLost()
        } else if emeryScore == pointLimit{
            delegate?.didReceiveBankerBJ()
        } else if emeryCards.count == cardLimit {
            delegate?.didReceiveUserLost()
        }
    }
    
    private func resetCardIndex() {
        nextCardIndex = 4
    }
    
    func start() {
        resetCardIndex()
        
        self.pokerDeck = pokerDeck.shuffled()
        
        userCards = getUserFirstCars(deck: pokerDeck)
        
        emeryCards = getEmeryFirstCars(deck: pokerDeck)
        
        checkUserPoint()
        
        checkBankerPoint()
        
    }
    /// Hit方法
    func hit() {
        guard let poker = getCard() else { return }
        
        userCards.append(poker)
        
        checkUserPoint()
    }
    
    /// Stand方法
    func stand() {
        startBankerRound()
    }
    
    private func startBankerRound() {
        emeryGetCard()
    }
    
    private func emeryGetCard()  {
        guard let poker = getCard() else { return }
        emeryCards.append(poker)
    }
}
