//
//  SwiftUIView.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 17/02/25.
//

import SwiftUI


struct OnboardingComponent: View {
    var imageName: String
    var rectangleColor: Color
    var colorText: String
    
    var caseWhite: Bool = false
    
    var body: some View {
        
        HStack(spacing:100){
            VStack(spacing: 50){
                
                Image(imageName)
                
                RoundedRectangle(cornerRadius: 10)
                    .if(caseWhite) { roundedRectangle in
                        roundedRectangle
                            .strokeBorder(.black, lineWidth: 2)
                    }
                    .frame(width:90, height: 90)
                    .foregroundStyle(rectangleColor)
                Text(colorText)
            }
        }
    }
    
}


#Preview {
    OnboardingComponent(imageName: "Blue", rectangleColor: .white, colorText: "blue")
}
