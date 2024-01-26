//
//  AddItemView.swift
//  Loot
//
//  Created by Nathael MEUNIER on 19/01/2024.
//
import SwiftUI

struct AddItemView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var inventory: Inventory
    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    @State private var game: Game = .emptyGame
    @State private var quantity: Int = 1
    @State private var itemType: ItemType = .unknown
    @State private var hasAttack: Bool = false
    @State private var attackStrength: Int = 0

    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }

            Section {
                Picker("Jeu", selection: $game) {
                    Text("Empty Game")
                        .tag(Game.emptyGame)
                    ForEach(availableGames, id: \.self) { game in
                        Text(String(describing: game.name).capitalized)
                            .tag(game)
                    }
                }
                Stepper("Combien : \(quantity)", value: $quantity, in: 1...100)
            }
            
            Section {
                HStack {
                    Text("Type")
                    Spacer()
                    Text("\(itemType.rawValue)")
                }
                Picker("Type", selection: $itemType) {
                    ForEach(ItemType.allCases, id: \.self) { type in
                        Text(String(describing: type.rawValue).capitalized)
                            .tag(type)
                    }
                }
                .pickerStyle(.palette)
            }
            
            Section {
                Toggle("Item d'attaque ?", isOn: $hasAttack)
                
                if hasAttack {
                    Stepper("Force d'attaque : \(attackStrength)", value: $attackStrength, in: 0...100)
                }
            }


            Section {
                Button(action: {
                    let newItem = LootItem(quantity: quantity, name: name, type: itemType, rarity: rarity, attackStrength: 20, game: game)
                    inventory.addItem(item: newItem)
                    isPresented.toggle() // Ferme la vue d'ajout
                }) {
                    Text("Ajouter")
                }
            }
        }
    }
}



