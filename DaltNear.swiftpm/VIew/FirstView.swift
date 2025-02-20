//
//  SwiftUIView.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 18/02/25.
//

import SwiftUI


struct FirstView: View {
    
    var body: some View {
        NavigationStack{
            NavigationLink {
                OnboardingView()
            } label: {
                
                VStack{
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height:250)
                    Spacer()
                    
                    Text("Tap to start")
                        .foregroundStyle(.blue)
                        .font(.largeTitle)
                        .padding(.bottom, 40)
                    
                }
                
                
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
    
    
}

#Preview {
    FirstView()
}
