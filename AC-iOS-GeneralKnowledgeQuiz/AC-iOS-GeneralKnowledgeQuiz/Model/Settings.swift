//
//  Settings.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/8/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import Foundation


enum Difficulty: String {
    case all, easy, medium, hard
    static let cases: [Difficulty] = [.all, .easy, .medium, .hard]
}

enum QuestionType: String {
    case all, multiple, boolean
    static let cases: [QuestionType] = [.all, .multiple, .boolean]
}


class Settings {
    static var difficulty: Difficulty = .all
    static var type: QuestionType = .all
    static var category: String = "All"
    
}
