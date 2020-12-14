//
//  CardModel.swift
//  21poker
//
//  Created by Kenny on 2020/12/11.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import Foundation

protocol DeckModelDelegate: AnyObject  {
   
}

class DeckModel {
    
    weak var delegate: DeckModelDelegate?
    
    private var deck: PokerType? = nil
    
    private lazy var manager: DeckManager = {
        let deckManager = DeckManager()
        return deckManager
    }()


}
// MARK: - Data Logic
extension DeckModel {
 
}
// MARK: - 從 呼叫API
extension DeckModel {
    /// 開啟遊戲會直接領取Deck
    func getDeck() {
        manager.getDeckId()
        
    }
    /// 直接領兩張牌
    func drewDeck()  {
        manager.drewDeck()
    }
    /// 單抽一張Hit
    func hitDeck() {
        manager.hitDeck()
    }
}
// MARK: - 從 Manager拿資料儲存在Cards裡面
extension DeckModel: DeckManagerDelegate {
    func didGetDeck(deck: PokerType) {
        self.deck = deck
    }
}
