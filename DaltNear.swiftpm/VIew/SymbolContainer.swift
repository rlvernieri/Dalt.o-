//
//  SymbolContainer.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 15/02/25.
//

import SwiftUI

struct SymbolContainer: View {
    
    let symbol: Symbol
    
    @ObservedObject var viewModel: ViewModel
    
    private let regularSize: CGFloat = 100
    private let highlightedSize: CGFloat = 150
    
    var body: some View {
        ZStack {
            
            symbol.image
                .resizable()
                .scaledToFit()
                .frame(width: regularSize, height: regularSize)
            
            if viewModel.isHighlighted(id: symbol.id) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black)
                    .opacity(0.5)
                    .frame(
                        width: highlightedSize,
                        height: highlightedSize
                    )
            }
            
        }
        .overlay {
            GeometryReader { proxy -> Color in
                viewModel.update(
                    frame: proxy.frame(in: .global),
                    for: symbol.id
                )
                
                return Color.clear
            }
        }
        .frame(width: highlightedSize, height: highlightedSize)
    }
}
