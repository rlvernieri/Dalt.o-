//
//  RandomSelector.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 17/02/25.
//

import Foundation

class RandomSelector<T: CaseIterable> where T: Hashable {
    
    private var previousChoice: T? = nil
    private var lastSubset: [T] = []
    
    func getRandomSubset() -> [T] {
        let allCases = T.allCases
        let shuffledCases = allCases.shuffled()
        let subset = Array(shuffledCases.prefix(6))
        lastSubset = subset
        return subset
    }
    
    func getRandomElement() -> T? {
        let filteredSubset = lastSubset.filter { $0 != previousChoice }
        
        let chosenElement = filteredSubset.randomElement() ?? lastSubset.randomElement()
        
        previousChoice = chosenElement
        return chosenElement
    }
}
