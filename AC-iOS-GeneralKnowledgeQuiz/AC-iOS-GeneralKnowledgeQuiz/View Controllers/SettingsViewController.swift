//
//  SettingsViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/8/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        refreshUI()
    }
    
    func refreshUI() {
        difficultySegmentedControl.selectedSegmentIndex = Difficulty.cases.index(of: Settings.difficulty)!
        typeSegmentedControl.selectedSegmentIndex = QuestionType.cases.index(of: Settings.type)!
        if let rowIndex: Int = Question.categories.index(of: Settings.category) {
            categoryPickerView.selectRow(rowIndex, inComponent: 0, animated: false)
        }
    }
    
    @IBAction func settingsSegmentedControlDidChange(_ sender: UISegmentedControl) {
        
        switch sender {
        case difficultySegmentedControl:
            Settings.difficulty = Difficulty.cases[sender.selectedSegmentIndex]
        case typeSegmentedControl:
            Settings.type = QuestionType.cases[sender.selectedSegmentIndex]
        default:
            break
        }
    }
    
    
    // MARK: - PickerViewDelegate and DataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Question.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Question.categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Settings.category = Question.categories[row]
    }

}
