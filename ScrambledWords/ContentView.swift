//
//  ContentView.swift
//  ScrambledWords
//
//  Created by Hun Min Cho on 3/19/25.
//

import SwiftUI

//Hashable

//map, compactMap, filter, firstIndex, reduce

//map - transforms



struct ContentView: View {
    
//    @State var letters: [Letter] = [
//        Letter(id: 0, text: "A"),
//        Letter(id: 1, text: "O"),
//        Letter(id: 2, text: "R"),
//        Letter(id: 3, text: "E"),
//        Letter(id: 4, text: "N"),
//        Letter(id: 5, text: "G"),
//    ]
    @State private var guessedLetters: [Letter] = []
    @State private var showSuccess = false
    @State private var showFailure = false
    @State private var score = 0
//    let correctAnsweer = "ORANGE"
    @State var questions: [Question] = [
        Question(image: "orange", scrampledletters: [
            Letter(id: 0, text: "A"),
            Letter(id: 1, text: "O"),
            Letter(id: 2, text: "R"),
            Letter(id: 3, text: "E"),
            Letter(id: 4, text: "N"),
            Letter(id: 5, text: "G")
        ], answer: "ORANGE"),
        Question(image: "banana", scrampledletters: [
            Letter(id: 0, text: "A"),
            Letter(id: 1, text: "A"),
            Letter(id: 2, text: "N"),
            Letter(id: 3, text: "B"),
            Letter(id: 4, text: "N"),
            Letter(id: 5, text: "N")
        ], answer: "BANANA"),
        Question(image: "apple", scrampledletters: [
            Letter(id: 0, text: "P"),
            Letter(id: 1, text: "A"),
            Letter(id: 2, text: "P"),
            Letter(id: 3, text: "E"),
            Letter(id: 4, text: "L"),
        ], answer: "APPLE")
    ]
    
    @State private var currentQuestionIndex = 0
    
    var body: some View {
            GeometryReader { proxy in
                ZStack{
                    Color.background
                        .ignoresSafeArea()
                    VStack {
                        VStack {
                            Spacer()
                            Image(questions[currentQuestionIndex].image)
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
                                                    questions[currentQuestionIndex].scrampledletters[guessedLetter.id].text = guessedLetter.text
                                                    //letters[guessedLetter.id].text = guessedLetter.text
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
                        Text("Score \(score)")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.white)
                            .padding(.top)
                        HStack{
//                            ForEach(Array(letters.enumerated()), id: \.1){ index, letter in
                            ForEach(Array(questions[currentQuestionIndex].scrampledletters.enumerated()), id: \.1){ index, letter in
                                LetterView(letter: letter)
                                    .onTapGesture {
                                        if !letter.text.isEmpty { //글자가 없을때 터치하면 추가하지 못하게
                                            guessedLetters.append(letter)
                                            questions[currentQuestionIndex].scrampledletters[index].text  = ""
                                            if guessedLetters.count == questions[currentQuestionIndex].scrampledletters.count {
                                                let gussedAnswer = guessedLetters.map { $0.text}.joined()
                                                if gussedAnswer == questions[currentQuestionIndex].answer {
                                                    showSuccess = true
                                                    score += 1
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                                        showSuccess = false
                                                    })
                                                } else {
                                                    showFailure = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                                        showFailure = false
                                                    })
                                                }
                                            }
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
                    if showFailure {
                        VStack{
                            Image("cross")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.3))
                    }
                    if showSuccess {
                        VStack{
                            Image("tick")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.3))
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
