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
    
    var isSpecialAce = true
    
    var point: Int {
        
        if pokerNumber == 1,
           isSpecialAce {
            return 11
        }
        return pokerNumber
    }
}
