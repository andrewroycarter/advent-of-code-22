//
//  File.swift
//  
//
//  Created by Andrew Carter on 12/5/22.
//

import Foundation
import XCTest
@testable import Advent22

final class Day3SolutionTests: XCTestCase {

    func testProblemOneExampleSolution() throws {
        let inputText = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
        let solution = Day3Solution(shouldFindBadgeSum: false)
        XCTAssertEqual(try solution.solve(for: inputText), 157)
    }
    
    func testProblemOneSolution() throws {
        let inputTextURL = try XCTUnwrap(
            Bundle
                .module
                .url(forResource: "day3",
                     withExtension: "txt")
        )
    
        let inputText = try String(contentsOf: inputTextURL)
        let solution = Day3Solution(shouldFindBadgeSum: false)
        XCTAssertEqual(try solution.solve(for: inputText), 7863)
    }
    
    func testProblemTwoExampleSolution() throws {
        let inputText = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
        let solution = Day3Solution(shouldFindBadgeSum: true)
        XCTAssertEqual(try solution.solve(for: inputText), 70)
    }
    
    func testProblemTwoSolution() throws {
        let inputTextURL = try XCTUnwrap(
            Bundle
                .module
                .url(forResource: "day3",
                     withExtension: "txt")
        )
    
        let inputText = try String(contentsOf: inputTextURL)
        let solution = Day3Solution(shouldFindBadgeSum: true)
        XCTAssertEqual(try solution.solve(for: inputText), 2488)
    }
    
}
