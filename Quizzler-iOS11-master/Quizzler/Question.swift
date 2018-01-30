//
//  Question.swift
//  Quizzler
//
//  Created by Ricardo Wiggins on 1/28/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

//class for each question
class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}
