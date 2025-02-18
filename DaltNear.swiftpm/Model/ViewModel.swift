//
//  File.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 15/02/25.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    
    // MARK: - Gesture Properties
    
    @Published var currentSymbol: Symbol?
    @Published var currentPosition = initialPosition
    @Published var highlightedId: Int?
    @Published var draggableToyOpacity: CGFloat = 1.0
    
    private(set) var attempts = 0
    private var randomSelector = RandomSelector<Symbol>()
    
    // MARK: - Coordinates
    
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 100
    )
    
    private var frames: [Int: CGRect] = [:]
    
    // MARK: - Objects in the screen
    
    var symbols: [Symbol]
    
    // MARK: - Game lifecycle
    func confirmWhereToyWasDropped() {
        defer { highlightedId = nil }
        
        guard let highlightedId = highlightedId else {
            resetPosition()
            return
        }
        
        if highlightedId == currentSymbol?.id {
            setCurrentPositionToHighlightedContainer(WithId: highlightedId)
            generateNextRound()
        } else {
            resetPosition()
        }
        
        attempts += 1
    }
    
    func resetPosition() {
        currentPosition = ViewModel.initialPosition
    }
    
    func setCurrentPositionToHighlightedContainer(WithId id: Int) {
        guard let frame = frames[id] else {
            return
        }
        currentPosition = CGPoint(x: frame.midX, y: frame.midY)
        makeToyInvisible()
    }
    
    func makeToyInvisible() {
        draggableToyOpacity = 0
    }
    
    func generateNextRound() {
            
        withAnimation {
            symbols = randomSelector.getRandomSubset()
        }
        
        currentSymbol = randomSelector.getRandomElement()
            
        withAnimation(.none) {
            resetPosition()
            restoreOpacityWithAnimation()
        }
    }
    
    func restoreOpacityWithAnimation() {
        withAnimation {
            draggableToyOpacity = 1.0
        }
    }
    
    func generateNewGame() {
        attempts = 0
        generateNextRound()
    }
    
    // MARK: - Updates in the screen
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    func update(dragPosition: CGPoint) {
        currentPosition = dragPosition
        for (id, frame) in frames where frame.contains(dragPosition) {
            highlightedId = id
            return
        }
        
        highlightedId = nil
    }
    
    func isHighlighted(id: Int) -> Bool {
        highlightedId == id
    }
    
    init() {
        self.symbols = randomSelector.getRandomSubset()
        self.currentSymbol = randomSelector.getRandomElement()
    }
}
