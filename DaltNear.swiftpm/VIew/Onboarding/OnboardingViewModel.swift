//
//  SwiftUIView.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 17/02/25.
//

import SwiftUI

struct OnboardingViewModel: View {
    var title: String
    var bodyText: String
    
    var body: some View {
        
        VStack{
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            
            Text(bodyText)
                .font(.title)
                .fontWeight(.regular)
                .padding(.horizontal, 60)
        }
        
    
    }
    
}

//#Preview {
//    OnboardingViewModel()
//}
