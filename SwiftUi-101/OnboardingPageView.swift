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
                .font(.system(size: 60))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Circle()
                .fill(color)
                .frame(width: 250, height: 250)
                .overlay(
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                )

            Text(description)
                .font(.body)
                .padding()

            Button(action: onNext) {
                Text(button)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 240, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

