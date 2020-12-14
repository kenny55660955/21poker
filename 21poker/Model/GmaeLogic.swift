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
    
}
class GameLogic {
    
    //MARK: - Model
    private lazy var model: DeckModel = {
        let deckModel = DeckModel()
        return deckModel
    }()
    
    
    
    // MARK: - Data
    /// model拿 deck資料
    func getDeck() {
        model.getDeck()
        print("0000 1.完成換新牌")
    }
    
    func getImage() -> String {
       let string =  model.setupImage()
        return string
    }
    
    // MARK: - Method
    /// 開始取得牌
    func start() {
        model.drewDeck()
        print("0000 2.完成抽牌")
    }
    
    /// 點擊hit拿牌
    func hit() {
        model.hitDeck()
    }
    
    /// Stand方法
    func stand() {
        
    }
    
    /// 重置按鈕
    func replay () {
        getDeck()
        
        start()
    }
}
