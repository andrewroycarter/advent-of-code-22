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
    @Flag(help: "Calculates the total of the top three elves.") var top3 = false
    
    static public var configuration = CommandConfiguration(
        commandName: "day1",
        abstract: "test",
        subcommands: [])
    
    public init() {
        
    }

    public func run() throws {
        let inputText = try String(contentsOfFile: input)
        let solution = Day1Solution(shouldCalculateTopThree: top3)
        let value = try solution.solve(for: inputText)
        
        if top3 {
            print("The top 3 elves are carrying \(value) calories.")
        } else {
            print("The elf with the most calories is carrying \(value) calories.")
        }
    }
    
}
