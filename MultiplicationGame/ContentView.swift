//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Marc-Developer on 8/27/22.
//

import SwiftUI

struct ContentView: View {
    @State private var timesTableSelection: Int = 2
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose a times table to Study")
                
                HStack {
                    Button("2") {
                        timesTableSelection = 2
                    }
                    Button("3") {
                        timesTableSelection = 3
                    }
                    Button("4") {
                        timesTableSelection = 4
                    }
                }
                .font(.system(size: 36))
                .buttonStyle(.bordered)
                
                HStack {
                    Button("5") {
                        timesTableSelection = 5
                    }
                    Button("6") {
                        timesTableSelection = 6
                    }
                    Button("7") {
                        timesTableSelection = 7
                    }
                }
                .font(.system(size: 36))
                .buttonStyle(.bordered)
                
                
                HStack {
                    Button("8") {
                        timesTableSelection = 8
                    }
                    Button("9") {
                        timesTableSelection = 9
                    }
                    Button("10") {
                        timesTableSelection = 10
                    }
                }
                .font(.system(size: 36))
                .buttonStyle(.bordered)
                
                HStack {
                    Button("11") {
                        timesTableSelection = 11
                    }
                    Button("12") {
                        timesTableSelection = 12
                    }
                }
                .font(.system(size: 36))
                .buttonStyle(.bordered)
                
                Text("Times Table: \(timesTableSelection)")
                
                NavigationLink("Play Quiz") {
                    QuizView(timesTableSelection: timesTableSelection)
                }
            }
        }
    }
}

struct QuizView: View {
    @State private var questionNumber = 1
    @State private var gameIsActive = false
    @State private var operand = Int.random(in: 0...12)
    @State private var playerAnswer = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var currentScore = 0
    
    var timesTableSelection: Int
    var answer: Int {
        multiply(timesTableSelection, by: operand)
    }
    
    var body: some View {
        Spacer()
        
        Text("Question \(questionNumber)")
            .font(.largeTitle)
        
        Spacer()
        
        Text("What is \(timesTableSelection) x \(operand) ?")
        
        Spacer()
        
        TextField("Type answer here", text: $playerAnswer)
            .padding(20)
            .onSubmit {
                submitAnswer()
                playerAnswer = ""
            }
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK") {
                    questionNumber += 1
                    askQuestion()
                }
            }
        
        Text("Temp answer: \(answer)")
        
        Spacer()
        
        Text("Score: \(currentScore)")
        
        Spacer()
    }
    
    func multiply(_ operand: Int, by otherOperand: Int) -> Int {
        return operand * otherOperand
    }
    
    func submitAnswer() {
        if answer == Int(playerAnswer) {
            alertMessage = "Correct"
            currentScore += 1
        } else {
            alertMessage = "Incorrect"
        }
        showAlert.toggle()
    }
    
    func askQuestion() {
        operand = Int.random(in: 0...12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
