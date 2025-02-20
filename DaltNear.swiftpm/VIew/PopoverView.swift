//
//  PopoverView.swift
//  Dalt.O!
//
//  Created by Rosa Laura Vernieri on 20/02/25.
//

import SwiftUI

struct PopoverView: View {
    
    var body: some View {
            
            VStack {
                Text("Hint for the combinations!")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .padding()
            }
            
            HStack(spacing: 30){
                VStack(spacing:20){
                    
                    Image("Red")
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:65, height: 65)
                        .foregroundStyle(.red)
                    Text("Red")
                        .foregroundStyle(.black)
                    
                    
                }
                VStack(spacing: 20){
                    
                    Image("Yellow1")
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:65, height: 65)
                        .foregroundStyle(.yellow)
                    Text("Yellow")
                        .foregroundStyle(.black)
                }
                VStack(spacing: 20){
                    
                    Image("Blue")
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:65, height: 65)
                        .foregroundStyle(.blue)
                    Text("Blue")
                        .foregroundStyle(.black)
                    
                }
            }.padding()
    }
}
