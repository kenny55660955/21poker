//
//  pokerType.swift
//  21poker
//
//  Created by Kenny on 2020/1/7.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import Foundation

struct PokerType {
    let pokerNumber: Int
    let image: String
    let porkerFlower: Int
    
    init(pokerNumber: Int, image: String, porkerFlower: Int) {
        self.pokerNumber = pokerNumber
        self.image = image
        self.porkerFlower = porkerFlower
    }
}
