//
//  File.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 18/02/25.
//

import SwiftUI

extension View {
   @ViewBuilder
   func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
