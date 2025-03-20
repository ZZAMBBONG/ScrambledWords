//
//  QuestionModel.swift
//  ScrambledWords
//
//  Created by Hun Min Cho on 3/20/25.
//

import Foundation

struct Question {
    let image: String
    var scrampledletters: [Letter]
    let answer: String
    
}

//MARK: - Generates Questions
extension Question {
    static func generateQuestions() -> [Question] {
        return [
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
                Letter(id: 5, text: "A")
            ], answer: "BANANA"),
            Question(image: "apple", scrampledletters: [
                Letter(id: 0, text: "P"),
                Letter(id: 1, text: "A"),
                Letter(id: 2, text: "P"),
                Letter(id: 3, text: "E"),
                Letter(id: 4, text: "L"),
            ], answer: "APPLE")
        ]
    }
}
