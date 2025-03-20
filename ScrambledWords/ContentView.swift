//
//  ContentView.swift
//  ScrambledWords
//
//  Created by Hun Min Cho on 3/19/25.
//

import SwiftUI

//Hashable

struct ContentView: View {
    
    @State var letters: [Letter] = [
        Letter(id: 0, text: "A"),
        Letter(id: 1, text: "O"),
        Letter(id: 2, text: "R"),
        Letter(id: 3, text: "E"),
        Letter(id: 4, text: "N"),
        Letter(id: 5, text: "G"),
    ]
    @State var guessedLetters: [Letter] = []
    
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
//                            ForEach (Array(guessedLetters.enumerated()), id: \.1) { index,
                            ForEach (guessedLetters) {
                                guessedLetter in
                                VStack{
                                    LetterView(letter: guessedLetter)
                                        .onTapGesture {

                                            if let index = guessedLetters.firstIndex(of: guessedLetter) {
                                                guessedLetters.remove(at: index)
                                                letters[guessedLetter.id].text = guessedLetter.text
                                            }
                                            
//                                            guessedLetters.remove(at: index)//터치된 글자 표시 삭제
//                                            letters[guessedLetter.id].text=guessedLetter.text//표시된 글자 터치시 다시 터치전상태로 돌아감
                                        }
                                    
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 25, height: 2)
                                }
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
                        ForEach(Array(letters.enumerated()), id: \.1){
                            index, letter in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    if !letter.text.isEmpty { //글자가 없을때 터치하면 추가하지 못하게
                                        guessedLetters.append(letter)
                                        letters[index].text  = ""
                                    }
                                }
                        }
//                        ForEach(letters, id: \.self){ letter in
//                            LetterView(character: letter)
//                                .onTapGesture {   // ORANGE를 터치했을때
//                                guessedLetters
//                                        .append(letter)
////                                    print("tapped latter view \(letter)")
//                                }
//                        }
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
    let letter: Letter
    var body: some View {
        Text(letter.text)
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
