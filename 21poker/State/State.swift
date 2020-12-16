//
//  State.swift
//  21poker
//
//  Created by Kenny on 2020/12/14.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import Foundation

enum State: Int {
    case start = 0, end
}

enum GameSet: Int {
    case playState, bankState
}
