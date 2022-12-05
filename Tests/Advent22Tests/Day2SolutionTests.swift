//
//  File.swift
//  
//
//  Created by Andrew Carter on 12/4/22.
//

import Foundation
import XCTest
@testable import Advent22

final class Day2SolutionTests: XCTestCase {
    
    func testProblemOneExampleSolution() throws {
        let inputText = """
A Y
B X
C Z
"""
        
        let solution = Day2Solution(useRoundEndCode: false)
        let value = try solution.solve(for: inputText)
        XCTAssertEqual(value, 15)
    }
    
    func testProblemOneSolution() throws {
        let inputTextURL = try XCTUnwrap(
            Bundle
                .module
                .url(forResource: "day2",
                     withExtension: "txt")
        )
    
        let inputText = try String(contentsOf: inputTextURL)
        let solution = Day2Solution(useRoundEndCode: false)
        XCTAssertEqual(try solution.solve(for: inputText), 14163)
    }
    
    func testProblemTwoExampleSolution() throws {
        let inputText = """
A Y
B X
C Z
"""
        
        let solution = Day2Solution(useRoundEndCode: true)
        let value = try solution.solve(for: inputText)
        XCTAssertEqual(value, 12)
    }
    
    func testProblemTwoSolution() throws {
        let inputTextURL = try XCTUnwrap(
            Bundle
                .module
                .url(forResource: "day2",
                     withExtension: "txt")
        )
    
        let inputText = try String(contentsOf: inputTextURL)
        let solution = Day2Solution(useRoundEndCode: true)
        XCTAssertEqual(try solution.solve(for: inputText), 12091)
    }
    
}
