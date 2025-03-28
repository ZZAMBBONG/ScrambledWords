//
//  ContentView.swift
//  ScrambledWords
//
//  Created by Hun Min Cho on 3/19/25.
//

import SwiftUI

//Hashable

struct ContentView: View {
    
    @State var letters: [String] = ["O","R", "A", "N", "G", "E"]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                Color.background
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Spacer()
                        Image("orange")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
                        HStack{
                            VStack{
                                LetterView(character: "")
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 25, height: 2)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: proxy.size.width * 0.9,
                           height: proxy.size.width * 0.9)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 2)
                    }
                    Text("Score 0")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.white)
                        .padding(.top)
                    HStack{
                        ForEach(letters, id: \.self){ letter in
                            LetterView(character: letter)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LetterView: View {
    let character: String
    var body: some View {
        Text(character)
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
