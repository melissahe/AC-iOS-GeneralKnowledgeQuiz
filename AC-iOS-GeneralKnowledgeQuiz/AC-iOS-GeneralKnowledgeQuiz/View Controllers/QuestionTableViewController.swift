//
//  QuestionTableViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/8/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class QuestionTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var allQuestions: [Question]!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var filteredQuestions: [Question] {
        var questionsToInclude = allQuestions!
        
        switch Settings.difficulty {
        case .all:
            break
        case .easy, .medium, .hard:
            questionsToInclude = questionsToInclude.filter { $0.difficulty == Settings.difficulty.rawValue }
        }
        
        switch Settings.type {
        case .all:
            break
        case .boolean, .multiple:
            questionsToInclude = questionsToInclude.filter { $0.type == Settings.type.rawValue }
        }
        
        if Settings.category != "All" {
            questionsToInclude = questionsToInclude.filter { $0.category == Settings.category }
        }
        return questionsToInclude
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func loadQuestions() {
        self.allQuestions = Question.questions
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleCell", for: indexPath)
        let question = filteredQuestions[indexPath.row]
        cell.textLabel?.text = question.question
        cell.detailTextLabel?.text = "Category: \(question.category), Difficulty: \(question.difficulty), Type: \(question.type)"
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuestionSegue",
            let detailVC = segue.destination as? QuestionDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            let question = filteredQuestions[indexPath.row]
            detailVC.question = question
        }
    }
}
