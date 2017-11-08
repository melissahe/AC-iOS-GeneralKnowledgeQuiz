//
//  QuestionDetailViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/8/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    var question: Question!
    
    var allAnswers: [String] = []
    
    @IBOutlet weak var answersPickerView: UIPickerView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answersPickerView.delegate = self
        answersPickerView.dataSource = self
        
        setupQuestionUI()
    }

    func setupQuestionUI() {
        allAnswers = (question.incorrectAnswers + [question.correctAnswer]).shuffled()
        questionLabel.text = question.question
    }
    
    
    // MARK: - PickerViewDelegate and DataSource Methods

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allAnswers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allAnswers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if allAnswers[row] == question.correctAnswer {
            self.view.backgroundColor = .green
        } else {
            self.view.backgroundColor = .red
        }
    }
    
}
