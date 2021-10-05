//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Kyle Lei on 2021/10/3.
//

import Foundation

func randomSign() -> Sign {
    return Sign(rawValue: Int.random(in: 1...Sign.allCases.count))!
}

enum Sign: Int, CaseIterable {
    case rock = 1
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "✊🏻"
        case .paper:
            return "🖐🏻"
        case .scissors:
            return "✌🏻"
        }
    }
        
    func gameState(against opponentSign: Sign) -> GameState {
        if self == opponentSign{
            return .draw
        }
        
        switch self {
        case .rock:
            if opponentSign == .scissors {return .win}
        case .paper:
            if opponentSign == .rock {return .win}
        case .scissors:
            if opponentSign == .paper {return .win}
        }
        
        return .lose
    }
}



/*
// Method 2 to match the string and sign
enum Sign: String {
    case rock = "✊🏻"
    case paper = "🖐🏻"
    case scissors = "✌🏻"
}
 var sign = Sign.rock
 print(sign.rawValue)
*/
