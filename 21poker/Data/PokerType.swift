//
//  pokerType.swift
//  21poker
//
//  Created by Kenny on 2020/1/7.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import Foundation
// MARK: - Welcome
struct PokerType: Codable {
    let success: Bool
    let deckID: String
    let cards: [Card]
    let remaining: Int

    enum CodingKeys: String, CodingKey {
        case success
        case deckID = "deck_id"
        case cards, remaining
    }
}

// MARK: - Card
struct Card: Codable {
    let code: String
    let image: String
    let images: Images
    let value, suit: String
}

// MARK: - Images
struct Images: Codable {
    let svg: String
    let png: String
}

