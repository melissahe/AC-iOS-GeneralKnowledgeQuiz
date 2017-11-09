//
//  QuestionsViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Data Source Variable
    var allQuestions: [Question] = []
    
    @IBOutlet weak var questionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
    }
    
    func loadData() {
        allQuestions = Question.questions
    }
    
    //MARK: - Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = questionsTableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath)
        let currentQuestion = allQuestions[indexPath.row]
        
        if let questionCell = cell as? QuestionTableViewCell {
            
            questionCell.questionLabel.text = currentQuestion.question
            questionCell.questionInfoLabel.text = "Category: \(currentQuestion.category), Difficulty: \(currentQuestion.difficulty), Type: \(currentQuestion.type)"
            
            return questionCell
        }
        
        return cell
    }
    
}
