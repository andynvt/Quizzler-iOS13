//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by ANDY on 13/08/2020.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var quesNo = 0
    var score = 0
    
    func getQuestionText() -> String {
        return quiz[quesNo].text
    }
    
    func getProgress() -> Float {
        return Float(quesNo + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getAnswer() -> [String] {
        return quiz[quesNo].answer
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let isCorrect = quiz[quesNo].correctAnswer == userAnswer
        if isCorrect {
            score += 1
        }
        return isCorrect
    }
    
    mutating func nextQuestion() {
        if quesNo < quiz.count - 1 {
            quesNo += 1
        } else {
            quesNo = 0
            score = 0
        }
    }
}
