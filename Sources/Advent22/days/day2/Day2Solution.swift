//
//  Day2Solution.swift
//  
//
//  Created by Andrew Carter on 12/4/22.
//

import Foundation

public struct Day2Solution {

    private enum RoundEndCode: String {
        case lose = "X"
        case draw = "Y"
        case win = "Z"
    }
    
    private enum Move {
        
        enum Result {
            case win
            case lose
            case draw
            
            var points: Int {
                switch self {
                case .win:
                    return 6
                    
                case .lose:
                    return 0
                    
                case .draw:
                    return 3
                }
            }
        }
        
        case rock
        case paper
        case scissors
        
        var beats: Move {
            switch self {
            case .rock:
                return .scissors
                
            case .paper:
                return .rock
                
            case .scissors:
                return .paper
            }
        }
        
        var losesTo: Move {
            switch self {
            case .rock:
                return .paper
                
            case .paper:
                return .scissors
                
            case .scissors:
                return .rock
            }
        }
        
        var draws: Move {
            return self
        }
        
        var points: Int {
            switch self {
            case .rock:
                return 1
                
            case .paper:
                return 2
                
            case .scissors:
                return 3
            }
        }
                
        init(code: String) throws {
            switch code {
                case "A", "X":
                self = .rock
                
            case "B", "Y":
                self = .paper
                
            case "C", "Z":
                self  = .scissors
                
            default:
                throw Advent22Error.invalidInputText
            }
        }
        
        func play(against move: Move) -> Result {
            switch (self, move) {
            case (.rock, .scissors),
                (.paper, .rock),
                (.scissors, .paper):
                return .win
                
            case (.rock, .paper),
                (.paper, .scissors),
                (.scissors, .rock):
                return .lose
                
            case (.rock, .rock),
                (.paper, .paper),
                (.scissors, .scissors):
                return .draw
            }
        }
    }
    
    private struct Round {
        let points: Int
        
        init(code: String) throws {
            let codes = code.components(separatedBy: " ")
            guard codes.count == 2 else {
                throw Advent22Error.invalidInputText
            }
            let elfMove = try Move(code: codes[0])
            let humanMove = try Move(code: codes[1])
            points = humanMove.play(against: elfMove).points + humanMove.points
        }
    }
    
    private struct EndCodedRound {
        let points: Int
        
        init(code: String) throws {
            let codes = code.components(separatedBy: " ")
            guard codes.count == 2,
            let end = RoundEndCode(rawValue: codes[1]) else {
                throw Advent22Error.invalidInputText
            }
            
            let elfMove = try Move(code: codes[0])
            
            let humanMove: Move
            switch end {
            case .draw:
                humanMove = elfMove.draws
                
            case .lose:
                humanMove = elfMove.beats
                
            case .win:
                humanMove = elfMove.losesTo
            }
            
            points = humanMove.play(against: elfMove).points + humanMove.points
        }
    }
    
    let useRoundEndCode: Bool
        
    func solve(for inputText: String) throws -> Int {
        let inputLines = inputText.components(separatedBy: "\n")
        let totalScore = try inputLines.reduce(0) { partialResult, line in
            guard !line.isEmpty else {
                return partialResult
            }
            
            if useRoundEndCode {
                let round = try EndCodedRound(code: line)
                return partialResult + round.points
            } else {
                let round = try Round(code: line)
                return partialResult + round.points
            }
        }
        return totalScore
    }
    
}
