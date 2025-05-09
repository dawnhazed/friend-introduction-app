//
//  HobbyCard.swift
//  IntroApp
//
//  Created by Nadaa Shafa Nadhifa on 09/05/25.
//

import SwiftUI

struct HobbyCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var image: String
}

var cards: [HobbyCard] = [
    .init(title: "Musical Instruments", image: "guitar"),
    .init(title: "Dance", image: "guitar"),
    .init(title: "Dance", image: "guitar"),
    .init(title: "Dance", image: "guitar")
]

//#Preview {
//    HobbyCard()
//}
