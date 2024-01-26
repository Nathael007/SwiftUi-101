//
//  ContentView.swift
//  loot
//
//  Created by Nathael MEUNIER on 19/01/2024.
//

import SwiftUI

enum LooterFeature {
    case loot
    case wishList
    case profile
}

class Inventory: ObservableObject {
    @Published var loot: [LootItem] =  [
        LootItem(name: "Épée magique", type: .magic, rarity: .epic, attackStrength: 20, game: .emptyGame),
        LootItem(name: "Bouclier en feu", type: .fire, rarity: .legendary, game: .emptyGame),
        LootItem(name: "Potion glaciale", type: .ice, rarity: .rare, game: .emptyGame),
        LootItem(name: "Objet Unique", type: .ice, rarity: .unique, game: .testGame)
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @State private var selectedFeature: LooterFeature = .loot

    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView()
                .tabItem {
                    Label("Loot", systemImage: "bag.fill")
                }
                .tag(LooterFeature.loot)
            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(LooterFeature.wishList)
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeature.profile)
        }
    }
}

struct LootView: View    {
    @StateObject var inventory = Inventory()
    @State private var showAddItemView = false
    @State private var shouldDelete = false
    @Environment(\.editMode) private var editMode

    var body: some View {
        NavigationView {
            List {
                ForEach(inventory.loot, id: \.name) { item in
                    NavigationLink {
                        LootDetailView(item: item) // On passe directement l'item à la vue
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Circle()
                                    .foregroundColor(item.rarity.color)
                                    .frame(width: 10, height: 10)
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text(item.type.rawValue)
                                    .font(.headline)
                            }
                            Text("Quantity: \(item.quantity)")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView(isPresented: $showAddItemView).environmentObject(inventory)
            })
            .navigationBarTitle("💼 Loot")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
    }
}


#Preview {
    ContentView()
}

