//
//  SwiftUIView.swift
//  DaltNear
//
//  Created by Rosa Laura Vernieri on 17/02/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack{
            
            TabView{
                OnboardingViewModel(
                    title: "How does Dalt.O! work?", bodyText: "It is a little game which uses the ColorADD alphabet for colorblind people to make not colorblind people more aware of the new possibilites to make the world fully accessible")
                
                VStack(spacing:50){ Text ("Everything starts with primary colors")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack(spacing: 100){
                        
                        OnboardingComponent(imageName: "Red", rectangleColor: .red, colorText: "Red")
                        
                        OnboardingComponent(imageName: "Yellow", rectangleColor: .yellow, colorText: "Yellow")
                        
                        
                        OnboardingComponent(imageName: "Blue", rectangleColor: .blue, colorText: "Blue")
                        
                    }
                }
                
                
                VStack(spacing:50){ Text ("Their combination brings to secondary colors")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    HStack(spacing: 100){
                        OnboardingComponent(imageName: "Orange", rectangleColor: .orange, colorText: "Orange")
                        
                        OnboardingComponent(imageName: "Green", rectangleColor: .green, colorText: "Green")
                        
                        
                        OnboardingComponent(imageName: "Purple", rectangleColor: .purple, colorText: "Purple")
                        
                        OnboardingComponent(imageName: "Brown", rectangleColor: .brown, colorText: "Brown")
                        
                    }
                }
                
                
                VStack(spacing:50){
                    Spacer()
                    Text ("Additional colors")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    HStack(spacing: 100){
                        OnboardingComponent(imageName: "Black", rectangleColor: .black, colorText: "Black")
                        
                        
                        
                        
                        OnboardingComponent(imageName: "White", rectangleColor: .white, colorText: "White", caseWhite: true)
                        
                    }
                    Spacer()
                    NavigationLink {
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        Text("Start!")
                            .foregroundStyle(.blue)
                            .font(.title)
                    }
                    .offset(y: -70)
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        
    }
}

#Preview {
    OnboardingView()
}
