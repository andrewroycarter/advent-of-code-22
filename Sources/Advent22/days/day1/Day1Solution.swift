//
//  File.swift
//  
//
//  Created by Andrew Carter on 12/4/22.
//

import Foundation

public struct Day1Solution {
 
    func solve(for inputText: String) throws -> Int {
        let inputLines = inputText.components(separatedBy: "\n")
        let totals = try inputLines.reduce([0]) { partialResult, line in
            var partialResult = partialResult
            
            switch (line, Int(line), partialResult.last) {
                // Current line is empty, starting a new total by appending a 0
            case ("", _, _):
                return partialResult + [0]
                
                // Current line is a value, and we have an existing total to append to
            case (_, let value?, let currentTotal?):
                partialResult[partialResult.endIndex - 1] = currentTotal + value
                return partialResult
                
                // Only happens if input file has an invalid format
            default:
                throw Advent22Error.invalidInputText
            }
        }
        
        let sortedTotals = totals.sorted(by: >)
        guard let largestTotal = sortedTotals.first else {
            throw Advent22Error.invalidInputText
        }
        
        return largestTotal
    }
    
}
