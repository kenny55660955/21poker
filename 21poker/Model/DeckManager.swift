//
//  DeckManager.swift
//  21poker
//
//  Created by Kenny on 2020/12/14.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

//import Foundation
//
//protocol DeckManagerDelegate: AnyObject {
//    func didGetDeck(deck: PokerType)
//}
//
//class DeckManager {
//    
//    private let deckCount: Int = 1
//    
//    private let drawCount: Int = 2
//    
//    private var deckId: String? = nil
//    
//    weak var delegate: DeckManagerDelegate?
//   
//   /// 先拿取所有deck
//    func getDeckId() {
//        let url = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=\(deckCount)"
//        if let url = URL(string: url) {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                
//                if let error = error {
//                    print("Error: \(error.localizedDescription)")
//                } else if let response = response, let data = data {
//                    print("9999 \(response)")
//                    let decoder = JSONDecoder()
//                    if let deckData = try? decoder.decode(Deck.self, from: data) {
//                        /// 將同一份deckId 存起來
//                        self.deckId = deckData.deck_id
//                        print("=========DeckData=======")
//                        print(deckData)
//                        print("========================")
//                    }
//                }
//            }.resume()
//        } else {
//            print("Invalid URL")
//        }
//    }
//    
//    /// 開始抽取兩張動作
//    func drewDeck() {
//        guard let deckId = deckId else { return }
//        
//        let url = "https://deckofcardsapi.com/api/deck/\(deckId)/draw/?count=2"
//        
//        if let url = URL(string: url) {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                
//                if let error = error {
//                    print("Error: \(error.localizedDescription)")
//                } else if let data = data {
//
//                    let decoder = JSONDecoder()
//                    
//                    if let deckData = try? decoder.decode(PokerType.self, from: data) {
//                        self.delegate?.didGetDeck(deck: deckData)
//                        print("=========Deck=======")
//                        print("Deck名稱：\(deckData.deckID)")
//                        print("剩餘卡片數量: \(deckData.remaining)")
//                        print("========================")
//                    } else {
//                        print("Decode Fail")
//                    }
//                }
//            }.resume()
//        } else {
//            print("Invalid URL")
//        }
//    }
//    
//    /// 按鈕動作
//    func hitDeck() {
//        guard let deckId = deckId else { return }
//        
//        let url = "https://deckofcardsapi.com/api/deck/\(deckId)/draw/?count=1"
//        
//        if let url = URL(string: url) {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                
//                if let error = error {
//                    print("Error: \(error.localizedDescription)")
//                } else if let data = data {
//
//                    let decoder = JSONDecoder()
//                    
//                    if let deckData = try? decoder.decode(PokerType.self, from: data) {
//                        /// 抓到cards資料直接把cards整組丟出去
//    
//                        print("=========Deck=======")
//                        print("卡片花樣: \(deckData.cards[0].image)")
//                        print("卡片價值: \(deckData.cards[0].value)")
//                        print("剩餘卡片數量: \(deckData.remaining)")
//                        print("========================")
//                    }
//                }
//            }.resume()
//        } else {
//            print("Invalid URL")
//        }
//    }
//}
