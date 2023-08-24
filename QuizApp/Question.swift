//
//  Question.swift
//  QuizApp
//
//  Created by Mansour Mohammed Alshebli on 22/08/2023.
//

import Foundation

// Enum to represent the different options in a multiple-choice question
enum OptionChoice {
    case one, two, three, four
}

// Struct to represent a single quiz question
struct Question {
    // The title of the question
    var questionTitle: String
    
    // The four possible answer options for the question
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    
    // The correct answer option for the question
    var correctOption: OptionChoice
}
