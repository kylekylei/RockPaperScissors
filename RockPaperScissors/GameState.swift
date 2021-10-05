//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Kyle Lei on 2021/10/3.
//

import Foundation

enum GameState{
    case start
    case win
    case lose
    case draw
    
    var status: String{
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost!"
        case .draw:
            return "It's a Draw!"
        }
    }
}
