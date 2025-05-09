//
//  CarouselView.swift
//  IntroApp
//
//  Created by Nadaa Shafa Nadhifa on 09/05/25.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        NavigationView{
            VStack {
               Text("The Other Side of Her")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                
                ScrollView(.horizontal) {
                    HStack (spacing: 10, content: {
                        ForEach(cards) { card in
                            
                            GeometryReader(content: { geometry in
                                
                                let cardSize = geometry.size
                                
                                Image(card.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: cardSize.width, height: cardSize.height)
                                    .clipShape(.rect(cornerRadius: 20))
                                // .shadow
                            })
                            .frame(width: 250, height: 500)
                        }
                    }
                    )} .scrollIndicators(.hidden)
            }
           
        }
        .padding()
    }
}

#Preview {
    CarouselView()
}
