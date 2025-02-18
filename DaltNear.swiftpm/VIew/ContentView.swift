//
//  ContentView.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 15/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: ViewModel = .init()
   
    
    
    private let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    private var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location)
            }
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                withAnimation {
                    viewModel.confirmWhereToyWasDropped()
                }
            }
    }
    
    var body: some View {
    
        
        ZStack(alignment: .center) {
            
            LazyVGrid(columns: gridItems, spacing: 100) {
                ForEach(viewModel.symbols, id: \.id) { symbol in
                    SymbolContainer(
                        symbol: symbol,
                        viewModel: viewModel
                    )
                }
            }
            
            if let currentSymbol = viewModel.currentSymbol {
                
                DraggableSymbol(
                    symbol: currentSymbol,
                    position: viewModel.currentPosition,
                    gesture: drag
                )
                .opacity(viewModel.draggableToyOpacity)
                .offset(y: -50)
            }
        }
    }
}
