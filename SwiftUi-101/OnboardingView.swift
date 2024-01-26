//
//  OnboardingView.swift
//  Loot
//
//  Created by Nathael MEUNIER on 26/01/2024.
//
// ctrl+shift+L

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingDone: Bool
    @State private var currentStep: Int = 0

    var body: some View {
        TabView(selection: $currentStep) {
            OnboardingPageView(title: "Gérer ses loots", description: "Accéder facilemment à vos trouvailles et à votre collection personnelle", imageName: "gym.bag.fill", color: Color.blue, button: "Suivant", step: 0, totalSteps: 2, isLastStep: false, onNext: {
                currentStep = 1
            })

            OnboardingPageView(title: "Votre wishlist", description: "Créer une liste de souhaits pour garder une trace des articles que vous voulez acquérir.", imageName: "wand.and.stars.inverse", color: Color.purple, button: "Suivant", step: 1, totalSteps: 3, isLastStep: false, onNext: {
                currentStep = 2
            })
            
            OnboardingPageView(title: "En un coup d'oeil", description: "Accéder rapidemment à vos fonctionnalitées clés depuis l'écran d'acceuil de votre appareil.", imageName: "iphone.rear.camera", color: Color.orange, button: "Commencer", step: 2, totalSteps: 3, isLastStep: true, onNext: {
                isOnboardingDone = true
            })
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
