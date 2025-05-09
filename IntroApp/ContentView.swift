//
//  ContentView.swift
//  IntroApp
//
//  Created by Nadaa Shafa Nadhifa on 07/05/25.
//

import SwiftUI

struct InfoRow: View { // dibuat biar reusable, karena kita selalu pake itu
    let label: String // bikin variabel
    let value: String
    
    var body: some View { // harus ada dalem body
        HStack{
            Text(label)
                .fontWeight(.bold)
            Spacer()
            Text(value)
        
        }
    }
}

struct ContentView: View {
    let personInfo: [(label: String, value: String)] = [
        ("Nickname", "Icin"),
        ("Age", "20"),
        ("City", "Surabaya"),
        ("MBTI", "INFP"),
        ("Zodiac", "Libra"),
        ("Chinese Zodiac", "Wood Monkey")
    ]
    
    @State private var isTapped = false //to track if the button was tapped or not.
    @State private var isActive = false
    
    
    var body: some View {
        
        NavigationStack {
            ZStack{ // depth stack (layers)
                
                TimelineView(.animation){
                    context in
                    let s = context.date.timeIntervalSince1970
                    let v = Float(sin(s)) / 4
                    
                    
                    MeshGradient(
                        width: 3, // number of colors per row
                        height: 3, // number of colors per column
                        points: [ // sesuaikan dengan width and height jumlah pointsnya, [x, y]
                            [0.0, 0.0], [0.5, 0.0],         [1.0, 0.0],
                            [0.0, 0.5], [0.5 + v, 0.5 - v], [1.0, 0.3 - v],
                            [0.0, 1.0], [0.7 - v, 1.0],     [1.0, 1.0],
                        ],
                        colors: [ // color sesuai sama points
                            .softLavender,  .paleSkyBlue,   isActive ? .blushPink : .mintGreen,
                            .dustyRose,     .peachCream,    .babyBlue,
                            isActive ? .peachCream : .lilacMist,    .seafoamPastel, .blushPink
                        ]
                        
                    )
                }
                .ignoresSafeArea()
                .onAppear {
                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        isActive = true
                    }
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .frame(width: 340, height: 320)
                    .shadow(radius: 3)
               
                
                VStack {
                    NavigationLink(destination: CarouselView()) {
                        GroupBox {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("introducing".uppercased())
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.gray)
                                    Text("Euginia Gabrielle")
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                
                                Spacer()
                                
                                Image("profilePicture")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                            }
                            .padding([.bottom], 20)
                            
                            VStack(alignment: .leading) {
                                ForEach(personInfo.indices, id: \.self) { index in
                                    //personInfo.indices -> gives us the range of indices in the personInfo array (0, 1, 2, etc.)
                                    //id: \.self -> gives swiftUI a way to uniquely identify each element, in this case, using .self which is using they're own array index
                                    InfoRow(label: personInfo[index].label,
                                        value: personInfo[index].value)
                                    // for each iteration, create an InfoRow sesuai dengan index
                                        if index < personInfo.count - 1 { // Adds a divider after every item kecuali item terakhir
                                            Divider()
                                        }
                                }
                            }
                            
                        }
                    }
                    .padding(30)
                    .frame(width: 400)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isTapped.toggle()
                        print("Just tapped")
                        
                    }
                }
                
                .foregroundColor(.primary)
                
            }
        }
        
        
    }
    
}

extension Color {
  static let softLavender = Color(red: 220/255, green: 208/255, blue: 255/255)   // Soft lavender
  static let paleSkyBlue = Color(red: 176/255, green: 218/255, blue: 255/255)    // Pale sky blue
  static let mintGreen = Color(red: 198/255, green: 255/255, blue: 226/255)      // Mint green
  static let dustyRose = Color(red: 255/255, green: 198/255, blue: 218/255)      // Dusty rose
  static let peachCream = Color(red: 255/255, green: 224/255, blue: 196/255)     // Peach cream
  static let babyBlue = Color(red: 198/255, green: 222/255, blue: 255/255)       // Baby blue
  static let lilacMist = Color(red: 232/255, green: 208/255, blue: 238/255)      // Lilac mist
  static let seafoamPastel = Color(red: 202/255, green: 255/255, blue: 242/255)  // Seafoam pastel
  static let blushPink = Color(red: 255/255, green: 218/255, blue: 233/255)      // Blush pink
}

#Preview {
    ContentView()
}
