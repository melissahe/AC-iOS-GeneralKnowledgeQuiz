//
//  DetailedViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answersPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var question: Question!
    
    var currentQuestion: QuestionInfo {
        return QuestionInfo(of: question)
    }
    
    //Data Source Variable
    var answers: [String] = []
    
    //User Answer
    var selectedAnswer: Int = 0 {
        didSet {
            switch currentQuestion.checkAnswer(answers[selectedAnswer]) {
            case .correct:
                view.backgroundColor = .green
            case .incorrect:
                view.backgroundColor = .red
            }
            answersPickerView.resignFirstResponder()
            answersPickerView.isUserInteractionEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        loadData()
        answersPickerView.delegate = self
        answersPickerView.dataSource = self
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    //Setup
    func setUpLabels() {
        questionLabel.text = question.question
    }
    
    func loadData() {
        answers = currentQuestion.allAnswerChoices
    }
    
    //MARK: - Picker View Delegate Source Methods
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAnswer = row
    }
    
    //MARK: - Picker View Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers[row]
    }
}
