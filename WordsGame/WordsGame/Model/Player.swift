//
//  Player.swift
//  WordsGame
//
//  Created by MacBook on 05.06.2022.
//

import Foundation

struct Player {
    let name: String
    private(set)var score = 0
    
    mutating func add(score: Int) {
        self.score += score
    }
}
