//
//  File.swift
//  
//
//  Created by Andrew Carter on 12/5/22.
//

import Foundation

public struct Day3Solution {
 
    let shouldFindBadgeSum: Bool
    
    private func makePriorities() -> [UnicodeScalar : ClosedRange<Int>.Element] {
        let lowercaseLetters = (UnicodeScalar("a").value ... UnicodeScalar("z").value).compactMap(UnicodeScalar.init)
        let lowercaseValues = 1...26
        let lowercaseLettersAndValues = zip(lowercaseLetters, lowercaseValues)
        let lowercaseDictionary = Dictionary(uniqueKeysWithValues: lowercaseLettersAndValues)
        
        let uppercaseLetters = (UnicodeScalar("A").value ... UnicodeScalar("Z").value).compactMap(UnicodeScalar.init)
        let uppercaseValues = 27...52
        let uppercaseLettersAndValues = zip(uppercaseLetters, uppercaseValues)
        let uppercaseDictionary = Dictionary(uniqueKeysWithValues: uppercaseLettersAndValues)
        
        let priorities = lowercaseDictionary.merging(uppercaseDictionary) { (_, new) in new }
        
        return priorities
    }
    
    func solve(for inputText: String) throws -> Int {
        if shouldFindBadgeSum {
            return try solveForBadge(for: inputText)
        } else {
            return try solvePriority(for: inputText)
        }
    }
    
    private func splitLineIntoRucksacks(_ line: String) -> (left: Set<String.UnicodeScalarView.Element>, right: Set<String.UnicodeScalarView.Element>) {
        let values = Array(line.unicodeScalars)
        let left = Set(values[0 ..< values.count / 2])
        let right = Set(values[values.count / 2 ..< values.count])
        
        return (left, right)
    }
    
    private func solveForBadge(for inputText: String) throws -> Int {
        let priorities = makePriorities()
        let inputLines = inputText.components(separatedBy: "\n")
        let inputChunks = stride(from: 0, to: inputLines.count, by: 3).map { offset in
            Array(inputLines[offset ..< Swift.min(offset + 3, inputLines.count)])
        }
        let totalBadgeValue = try inputChunks.reduce(0) { partialResult, chunk in
            guard chunk.count == 3 else {
                return partialResult
            }
            
            let sets = chunk.map { Set($0.unicodeScalars) }
            
            guard let firstSet = sets.first else {
                throw Advent22Error.invalidInputText
            }
            
            let newSet = sets.dropFirst()
            let set = newSet.reduce(firstSet) { partialResult, `set` in
                return partialResult.intersection(`set`)
            }

            guard let badge = set.first,
            let value = priorities[badge] else {
                throw Advent22Error.invalidInputText
            }
            return partialResult + value
        }
        
        return totalBadgeValue
    }
    
    private func solvePriority(for inputText: String) throws -> Int {
        let priorities = makePriorities()
        let inputLines = inputText.components(separatedBy: "\n")

        let value = try inputLines.reduce(0) { partialResult, line in
            guard line != "" else {
                return partialResult
            }
            
            let (left, right) = splitLineIntoRucksacks(line)
            let intersection = left.intersection(right)
           
            guard let commonValue = intersection.first,
                  let priority = priorities[commonValue] else {
                throw Advent22Error.invalidInputText
            }
            
            return partialResult + priority
        }
        
        return value
    }
    
}
