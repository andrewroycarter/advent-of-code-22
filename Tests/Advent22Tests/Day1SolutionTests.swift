//
//  File.swift
//  
//
//  Created by Andrew Carter on 12/4/22.
//

import Foundation
import XCTest
@testable import Advent22

final class Day1SolutionTests: XCTestCase {

    func testValidKnownSolution() throws {
        let inputText = """
10
20

1
"""
        let solution = Day1Solution(shouldCalculateTopThree: false)
        XCTAssertEqual(try solution.solve(for: inputText), 30)
    }
    
    func testInvalidInputThrows() throws {
        let inputText = """
10
20
f
1
"""
        let solution = Day1Solution(shouldCalculateTopThree: false)
        XCTAssertThrowsError(try solution.solve(for: inputText))
    }
    
    func testValidKnownSolutionTop3() {
        let inputText = """
1
1

1
1
1

1
1
1
1

1
"""
        
        let solution = Day1Solution(shouldCalculateTopThree: true)
        XCTAssertEqual(try solution.solve(for: inputText), 9)
    }
    
    func testTop3FailWithLessThanThreeElves() {
        let inputText = """
1
1

1
1
1
"""

        let solution = Day1Solution(shouldCalculateTopThree: true)
        XCTAssertThrowsError(try solution.solve(for: inputText))
    }
        
    func testProblemOneSolution() throws {
        let inputTextURL = try XCTUnwrap(
            Bundle
                .module
                .url(forResource: "day1",
                     withExtension: "txt")
        )
    
        let inputText = try String(contentsOf: inputTextURL)
        let solution = Day1Solution(shouldCalculateTopThree: false)
        XCTAssertEqual(try solution.solve(for: inputText), 70369)
    }
    
    func testProblemTwoSolution() throws {
        let inputTextURL = try XCTUnwrap(
            Bundle
                .module
                .url(forResource: "day1",
                     withExtension: "txt")
        )
    
        let inputText = try String(contentsOf: inputTextURL)
        let solution = Day1Solution(shouldCalculateTopThree: true)
        XCTAssertEqual(try solution.solve(for: inputText), 203002)
    }
}
