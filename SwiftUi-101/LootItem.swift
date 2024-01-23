//
//  LootItem.swift
//  Loot
//
//  Created by Nathael MEUNIER on 19/01/2024.
//

import SwiftUI

enum Rarity: String, CaseIterable {
    case common, uncommon, rare, epic, legendary, unique

    var color: Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.orange
        case .unique:
            return Color.red
        }
    }
}

enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}

struct LootItem: Identifiable {
    var id = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
}

