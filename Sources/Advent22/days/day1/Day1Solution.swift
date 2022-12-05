//
//  File.swift
//  
//
//  Created by Andrew Carter on 12/4/22.
//

import Foundation

public struct Day1Solution {
 
    private struct Elf {
        let caloriesHeld: Int
    }
    
    let shouldCalculateTopThree: Bool
    
    func solve(for inputText: String) throws -> Int {
        let inputLines = inputText.components(separatedBy: "\n")
        let elves = try inputLines.reduce([Elf(caloriesHeld: 0)]) { partialResult, line in
            var partialResult = partialResult
            
            switch (line, Int(line), partialResult.last) {
            case ("", _, _):
                return partialResult + [Elf(caloriesHeld: 0)]
                
            case (_, let value?, let currentElf?):
                let updatedElf = Elf(caloriesHeld: currentElf.caloriesHeld + value)
                partialResult[partialResult.endIndex - 1] = updatedElf
                return partialResult
                
            default:
                throw Advent22Error.invalidInputText
            }
        }

        let sortedElves = elves.sorted(by: { $0.caloriesHeld > $1.caloriesHeld })
        
        if !shouldCalculateTopThree,
           let topElf = sortedElves.first {
            return topElf.caloriesHeld
        } else if shouldCalculateTopThree,
                  sortedElves.count >= 3 {
            let topThreeTotal = sortedElves[0...2].reduce(0) { $0 + $1.caloriesHeld }
            return topThreeTotal
        } else {
            throw Advent22Error.invalidInputText
        }
    }
    
}
