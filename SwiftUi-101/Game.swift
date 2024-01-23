//
//  Game.swift
//  Loot
//
//  Created by Nathael MEUNIER on 19/01/2024.
//

import SwiftUI

enum GameGenre: String {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
    static var testGame = Game(name: "test", genre: .rpg, coverName: "eldenRing")
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "eldenRing"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyRim"),
    Game(name: "WoW", genre: .mmorpg, coverName: "wow"),
    Game(name: "CS:GO", genre: .fps, coverName: "csGo"),
    Game(name: "Diablo IV", genre: .looter, coverName: "diabloQuatre")
]
