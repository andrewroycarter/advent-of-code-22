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
        let inputText = try String(contentsOfFile: input)
        let largestTotal = try Day1Solution().solve(for: inputText)
        
        print("The elf with the most calories is carrying \(largestTotal) calories.")
    }
    
}
