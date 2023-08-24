//
//  ScoreView.swift
//  QuizApp
//
//  Created by Mansour Mohammed Alshebli on 22/08/2023.
//

import SwiftUI

// Struct to display the user's score after completing the quiz
struct ScoreView: View {
    // The user's score and the total number of questions in the quiz
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        VStack {
            // Display a circular progress view indicating the score as a percentage
            CircularProgressView(progress: CGFloat(score) / CGFloat(totalQuestions))
                .frame(width: 150, height: 150)
            
            // Text indicating the user's score
            Text("You got")
                .bold()
                .font(.title)
            
            // Text displaying the score and total questions
            Text("\(score)/\(totalQuestions)")
                .font(.title2)
        }
    }
}


struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 2, totalQuestions: 3)
    }
}
