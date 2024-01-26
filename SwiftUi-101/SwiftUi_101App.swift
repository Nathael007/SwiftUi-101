//
//  SwiftUi_101App.swift
//  SwiftUi-101
//
//  Created by Nathael MEUNIER on 23/01/2024.
//

import SwiftUI

@main
struct LootApp: App {
    @State private var isOnboardingDone: Bool = false

    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                ContentView()
            } else {
                OnboardingView(isOnboardingDone: $isOnboardingDone)
            }
        }
    }
}
