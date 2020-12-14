//
//  Deck.swift
//  21poker
//
//  Created by Kenny on 2020/12/14.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import Foundation

struct Deck: Codable {
    let success: Bool
    let deck_id: String
    let shuffled: Bool
    let remaining: Int
}
