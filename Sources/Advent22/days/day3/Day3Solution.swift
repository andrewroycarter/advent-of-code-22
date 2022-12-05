//
//  File.swift
//  
//
//  Created by Andrew Carter on 12/5/22.
//

import Foundation

public struct Day3Solution {
 
    func solve(for inputText: String) throws -> Int {
        let inputLines = inputText.components(separatedBy: "\n")
      
        let lowercaseLetters = (UnicodeScalar("a").value ... UnicodeScalar("z").value).compactMap(UnicodeScalar.init)
        let lowercaseValues = 1...26
        let lowercaseLettersAndValues = zip(lowercaseLetters, lowercaseValues)
        let lowercaseDictionary = Dictionary(uniqueKeysWithValues: lowercaseLettersAndValues)
        
        let uppercaseLetters = (UnicodeScalar("A").value ... UnicodeScalar("Z").value).compactMap(UnicodeScalar.init)
        let uppercaseValues = 27...52
        let uppercaseLettersAndValues = zip(uppercaseLetters, uppercaseValues)
        let uppercaseDictionary = Dictionary(uniqueKeysWithValues: uppercaseLettersAndValues)
        
        let priorities = lowercaseDictionary.merging(uppercaseDictionary) { (_, new) in new }

        let value = try inputLines.reduce(0) { partialResult, line in
            guard line != "" else {
                return partialResult
            }
            
            let values = Array(line.unicodeScalars)
            let left = Set(values[0 ..< values.count / 2])
            let right = Set(values[values.count / 2 ..< values.count])
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
