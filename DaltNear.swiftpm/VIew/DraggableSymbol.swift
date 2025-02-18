//
//  DraggableSymbol.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 15/02/25.
//

import SwiftUI

struct DraggableSymbol<Draggable: Gesture>: View {
    
    let symbol: Symbol
    let position: CGPoint
    let gesture: Draggable
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .fill(symbol.color)
            .frame(width: 100, height: 100)
            .shadow(radius: 10)
            .position(position)
            .gesture(gesture)
    }
}
