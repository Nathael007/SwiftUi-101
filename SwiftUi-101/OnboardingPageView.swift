//
//  OnboardingPageView.swift
//  SwiftUi-101
//
//  Created by Nathael MEUNIER on 26/01/2024.
//

import SwiftUI

struct OnboardingPageView: View {
    let title: String
    let description: String
    let imageName: String
    let color: Color
    let button: String
    let step: Int
    let totalSteps: Int
    let isLastStep: Bool
    let onNext: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            
            Circle()
                .fill(color)
                .frame(width: 250, height: 250)
                .overlay(
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .padding(10)
                )

            Text(description)
                .font(.body)
                .padding()

            Button(button, action: onNext)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
        }
        .padding()
    }
}
