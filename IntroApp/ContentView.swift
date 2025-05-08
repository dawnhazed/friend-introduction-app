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
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.pink.gradient.opacity(0.2))
                .ignoresSafeArea()
            
                
            
            VStack {
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
                            InfoRow(label: personInfo[index].label,
                                value: personInfo[index].value)
                                            
                                if index < personInfo.count - 1 {
                                    Divider()
                                }
                        }
                    }
                    .frame(width: 330)
                }
                .padding(16)
            }
        }
        
    }
    
}

#Preview {
    ContentView()
}
