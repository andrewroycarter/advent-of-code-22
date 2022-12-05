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
        XCTAssertEqual(30, try solution.solve(for: inputText))
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
        XCTAssertEqual(9, try solution.solve(for: inputText))
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
        
}
