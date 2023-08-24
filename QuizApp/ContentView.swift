//
//  ContentView.swift
//  QuizApp
//
//  Created by Mansour Mohammed Alshebli on 22/08/2023.
//

import SwiftUI



// The main content view of the quiz app
struct ContentView: View {
    // Array of questions for the quiz
    var questions = [Question(questionTitle: "What is Swift primarily used for?",
                              option1: "Websites",
                              option2: "Apps",
                              option3: "Editing videos",
                              option4: "Playing games",
                              correctOption:.two),
                     Question(questionTitle: "Which company created Swift?",
                              option1: "Apple",
                              option2: "Google",
                              option3: "Microsoft",
                              option4: "Amazon",
                              correctOption:.one),
                     Question(questionTitle: "What are Swift's playgrounds used for?",
                              option1: "Drawing",
                              option2: "Playing Videos",
                              option3: "Sending emails",
                              option4: "Coding",
                              correctOption:.four),
                     Question(questionTitle: "Which platform is Swift mainly associated with?",
                              option1: "Android",
                              option2: "iOS",
                              option3: "Windows",
                              option4: "Linux",
                              correctOption:.two),
                     Question(questionTitle: "What data type would you use to store whole numbers in Swift?",
                              option1: "string",
                              option2: "double",
                              option3: "int",
                              option4: "bool",
                              correctOption:.three),
                     Question(questionTitle: "What is the correct file extension for Swift source code files?",
                              option1: ".swift",
                              option2: ".java",
                              option3: ".py",
                              option4: ".html",
                              correctOption:.one),
                     Question(questionTitle: "Which loop is used to iterate over a sequence in Swift?",
                              option1: "while",
                              option2: "repeat",
                              option3: "loop",
                              option4: "for",
                              correctOption:.four)]
    
    // State variables to manage app behavior
    @State private var questionNumber: Int = 0
    @State private var isAlertPresented: Bool = false
    @State private var isCorrect: Bool = false
    @State var numOfCorrectQuestions: Int = 0
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        ZStack {
            // Background gradient for the entire view
            LinearGradient(colors: [.yellow, .red],
                           startPoint: .leading,
                           endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                // Progress bar showing the current question number
                ProgressView(value: Double(questionNumber),
                             total: Double(questions.count))
                    .padding()
                
                // Display the question title
                Text(questions[questionNumber % questions.count].questionTitle)
                    .padding()
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .center) {
                    HStack {
                        // Option buttons for choices 1 and 2
                        optionButton(optionNumber: .one, iconName: "triangle.fill")
                            .frame(width: 120)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .shadow(color: .red, radius: 1)
                            .cornerRadius(10)
                        
                        optionButton(optionNumber: .two, iconName: "circle.fill")
                            .frame(width: 120)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .shadow(color: .red, radius: 1)
                            .cornerRadius(10)
                    }
                    .padding()
                    HStack {
                        // Option buttons for choices 3 and 4
                        optionButton(optionNumber: .three, iconName: "diamond.fill")
                            .frame(width: 120)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .shadow(color: .red, radius: 1)
                            .cornerRadius(10)
                        
                        optionButton(optionNumber: .four, iconName: "square.fill")
                            .frame(width: 120)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.yellow)
                            .shadow(color: .red, radius: 1)
                            .cornerRadius(10)
                    }
                }
            }
            
            // Alert to display correct or wrong message after answering
            .alert(isCorrect ? "Correct" : "Wrong", isPresented: $isAlertPresented) {
                Button("Ok") {
                    if questionNumber == questions.count {
                        isSheetPresented = true
                        questionNumber = 0
                    }
                }
            } message: {
                Text(isCorrect ? "Congrats! You are quite smart..." : "How can you be getting this wrong?!")
            }
            
            // Sheet to display the score at the end of the quiz
            .sheet(isPresented: $isSheetPresented, onDismiss: { numOfCorrectQuestions = 0 }) {
                ScoreView(score: numOfCorrectQuestions, totalQuestions: questions.count)
            }
        }
    }
    
    // Function to handle option button tap
    func didTapOption(optionNumber: OptionChoice) {
        if optionNumber == questions[questionNumber % questions.count].correctOption {
            isCorrect = true
            numOfCorrectQuestions += 1
            questionNumber += 1
            print("Correct option!")
        } else {
            questionNumber += 1
            isCorrect = false
            print("Wrong option!")
        }
        isAlertPresented = true
    }
    
    // Function to create an option button
    func optionButton(optionNumber: OptionChoice, iconName: String) -> some View {
        Button {
            didTapOption(optionNumber: optionNumber)
        } label: {
            Image(systemName: iconName)
            switch optionNumber {
            case .one:
                Text(questions[questionNumber % questions.count].option1)
            case .two:
                Text(questions[questionNumber % questions.count].option2)
            case .three:
                Text(questions[questionNumber % questions.count].option3)
            case .four:
                Text(questions[questionNumber % questions.count].option4)
            }
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

