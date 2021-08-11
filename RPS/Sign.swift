//
//  Sign.swift
//  RPS
//
//  Created by mac on 11.08.2021.
//

import Foundation
//import GameplayKit
//
//
//let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)


func randomSign() -> Sign {
    let randomNumber = Int.random(in: 0...2)
    if randomNumber == 0 {
        return .paper
    } else if randomNumber == 1{
        return .rock
    } else {
        return .scissors
    }
}


enum Sign {
    case rock, paper, scissors
    
    var emoji : String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        default: return "✌️"
        }
    }
    
    func compareWith(_ oponentSign: Sign) -> GameState {
        switch (self, oponentSign) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper): return .win
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors): return .draw
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock): return .lose
        default: return .start
        }
    }
}
