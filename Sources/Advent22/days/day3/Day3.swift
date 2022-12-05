//
//  File 2.swift
//  
//
//  Created by Andrew Carter on 12/5/22.
//

import Foundation
import ArgumentParser

public struct Day3: ParsableCommand {
    
    @Argument(help: "Input file path.") var input: String

    static public var configuration = CommandConfiguration(commandName: "day3")
    
    public init() {
        
    }

    public func run() throws {
        let inputText = try String(contentsOfFile: input)
        let solution = Day3Solution()
        let value = try solution.solve(for: inputText)
        
        print("Priority items sum: \(value)")
    }
    
}
