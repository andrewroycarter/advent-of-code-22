//
//  Day2.swift
//  
//
//  Created by Andrew Carter on 12/4/22.
//

import Foundation
import ArgumentParser

public struct Day2: ParsableCommand {
    
    @Argument(help: "Input file path.") var input: String
    @Flag(help: "Uses the human move code for how to end the round.") var roundEndCode = false

    static public var configuration = CommandConfiguration(commandName: "day2")
    
    public init() {
        
    }

    public func run() throws {
        let inputText = try String(contentsOfFile: input)
        let solution = Day2Solution(useRoundEndCode: roundEndCode)
        let value = try solution.solve(for: inputText)
        
        print("Total score: \(value)")
    }
    
}
