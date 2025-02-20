//
//  Symbol.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 14/02/25.
//

import SwiftUI

enum Symbol: Int, Identifiable, CaseIterable, Hashable {
    
    case red = 1
    case orange = 2
    case green = 3
    case yellow = 4
    case brown = 5
    case blue = 6
    case purple = 7
    case black = 8
    case white = 9
    
    var id: Int { self.rawValue }
    
    var color: Color {
        switch self {
        case .red: .red
        case .orange: .orange
        case .green: .green
        case .yellow: .yellow
        case .brown: .brown
        case .blue: .blue
        case .purple: .purple
        case .black: .black
        case .white: .white
        }
    }
    
    var image: Image {
        switch self {
        case .red: .init("Red")
        case .orange: .init("Orange")
        case .green: .init("Green")
        case .yellow: .init("Yellow")
        case .brown: .init("Brown")
        case .blue: .init("Blue")
        case .purple: .init("Purple")
        case .black: .init("Black")
        case .white: .init("White")
        }
    }
}
