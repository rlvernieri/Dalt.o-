//
//  ContentView.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 15/02/25.
//

import SwiftUI


struct ContentView: View {
    
    @State var isPopoverPresented = false
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
            .overlay(alignment: .top) {
                Text("Ciao sono pippo")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y: -75)
            }
            
            if let currentSymbol = viewModel.currentSymbol {
                
                DraggableSymbol(
                    symbol: currentSymbol,
                    position: viewModel.currentPosition,
                    gesture: drag
                )
                .opacity(viewModel.draggableToyOpacity)
                .offset(y: -90)
            }
            
        }
        .overlay(alignment: .topTrailing) {
            Button("Hint") {
                self.isPopoverPresented = true
            }
            .font(.system(size: 25))
            .popover(isPresented: $isPopoverPresented) {
                PopoverView()
            }
            .padding(.top, 24)
            .padding(.horizontal, 64)
        }
    }
}

#Preview {
    ContentView()
}
