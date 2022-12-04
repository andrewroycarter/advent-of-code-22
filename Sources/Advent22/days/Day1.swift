//
//  Day1.swift
//  
//
//  Created by Andrew Carter on 12/4/22.
//

import Foundation
import ArgumentParser

public struct Day1: ParsableCommand {
    
    @Argument(help: "Input file path.") var input: String
    
    static public var configuration = CommandConfiguration(
        commandName: "day1",
        abstract: "test",
        subcommands: [])
    
    public init() {
        
    }

    public func run() throws {
        let inputString = try String(contentsOfFile: input)
        let inputLines = inputString.components(separatedBy: "\n")
        let totals = inputLines.reduce([0]) { partialResult, line in
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
                let errorMessage = """
Invalid input format. Expecting:
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""
                fatalError(errorMessage)
            }
        }
        
        let sortedTotals = totals.sorted(by: >)
        guard let largestTotal = sortedTotals.first else {
            fatalError("Expecting at least one numeric string in input file.")
        }
        
        print("The elf with the most calories is carrying \(largestTotal) calories.")
    }
    
}
