//
//  Current Question.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import Foundation

class QuestionInfo {
    enum Answer {
        case correct
        case incorrect
    }
    
    var currentQuestion: Question
    var allAnswerChoices: [String]
    
    init(of question: Question) {
        currentQuestion = question
        correctAnswer = question.correctAnswer
        
        //set all answers
        switch question.type {
        case "multiple":
            var answers: [String] = currentQuestion.incorrectAnswers
            let randomIndex = Int(arc4random_uniform(UInt32(answers.count)))
            answers.insert(currentQuestion.correctAnswer, at: randomIndex)
            allAnswerChoices = answers
        case "boolean":
            allAnswerChoices = ["true", "false"]
        default:
            fatalError("Could not produce answer. Check question.")
        }
    }
    
    func checkAnswer(_ answer: String) -> Answer {
        if answer == correctAnswer {
            return .correct
        }
        return .incorrect
    }
    
    //Private Implementation
    private var correctAnswer: String
}
