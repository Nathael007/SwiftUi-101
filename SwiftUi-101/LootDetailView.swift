//
//  LootDetailView.swift
//  Loot
//
//  Created by Nathael MEUNIER on 19/01/2024.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    @State private var showDetail: Bool = false

    var body: some View {
        VStack {
            Text(item.type.rawValue)
                .padding(.all, 20)
                .background(item.rarity.color)
                .font(.system(size: 100))
                .cornerRadius(25)
                .shadow(color: item.rarity.color, radius: 10, x: 0, y: 5)


            Text(item.name)
                .font(.largeTitle)
                .foregroundStyle(item.rarity.color)
                .bold()

            Spacer().frame(height: 70)
            if item.rarity.rawValue == "unique" {
                GeometryReader { geometry in
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(item.rarity.color)
                            .frame(width: geometry.size.width, height: 50)
                            .scaleEffect(showDetail ? 1.0 : 0.8)
                            .onAppear() {
                                withAnimation(Animation.easeInOut(duration: 0.2).delay(0.4)) {
                                    showDetail.toggle()
                                }
                            }
                        
                        Text("Item Unique 🏆")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(height: 50)
                    }
                }
                .frame(maxHeight: 50)
                .padding(10)
            }
            
            List {
                Section(header: Text("INFORMATIONS")) {
                    ZStack {
                        HStack {
                            if let coverName = item.game.coverName {
                                Image(coverName)
                                    .frame(width: 45, height: 58)
                                    .cornerRadius(4)
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color.gray)
                                        .opacity(0.4)
                                        .background(LinearGradient(gradient: Gradient(colors: [.gray]), startPoint: .topLeading, endPoint: .top))
                                        .cornerRadius(4)

                                    Image(systemName: "rectangle.slash")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .cornerRadius(4)
                                        .foregroundColor(Color.black.opacity(0.4))
                                        .aspectRatio(contentMode: .fit)
                                }
                                .frame(width: 45, height: 58)
                            }
                            
                        }.padding(.trailing, 90)
                        Text(item.game.name)
                    }
                    Text("In-Game : \(item.name)")
                    if let strength = item.attackStrength {
                        Text("Puissance (ATQ) : \(strength)")
                    }
                    Text("Possédé(s) : \(item.quantity)")
                    Text("Rareté : \(String(describing:item.rarity.rawValue).capitalized)")
                }
            }
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(name: "Épée magique", type: .magic, rarity: .epic, attackStrength: 20, game: Game(name: "Your Game", genre: .unset, coverName: nil)))
}
