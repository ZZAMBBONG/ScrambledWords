//
//  ScoreView.swift
//  ScrambledWords
//
//  Created by Hun Min Cho on 3/20/25.
//

import SwiftUI

struct ScoreView: View {
    
    let score: Int
    let questionCount: Int
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                Text("Final Score")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 26, weight: .bold))
                Text("Score: \(score) / \(questionCount)")
                    .foregroundStyle(Color.white)
            }
        }
    }
}

#Preview {
    ScoreView(score: 2, questionCount: 3)
}
