//
//  QuestionViewController.swift
//  HomeWorkThird
//
//  Created by Магомед Абдуразаков on 30/06/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var labelForQuestion: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionFirst: UIStackView!
    @IBOutlet var buttonsForFirstQuestion: [UIButton]!
    @IBOutlet var questionSecond: UIStackView!
    @IBOutlet var labelsForSecondQuestion: [UILabel]!
    @IBOutlet var switchs: [UISwitch]!
    @IBOutlet var questionThird: UIStackView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var labelsForThirdQuestion: [UILabel]!
    
    // MARK: - Private Properties
    
    private var questionIndex = 0
    private var questions = Question.all
    private var answerChose = [Answer]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "ResultSegue" else {return}
        
        let destinationView = segue.destination as! ResultViewController
        destinationView.responces = answerChose
        
    }
    
    // MARK: - Private methods
    
    private func update() {
        questionFirst.isHidden = true
        questionSecond.isHidden = true
        questionThird.isHidden = true
        
        navigationItem.title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
        
        let currentQuestion = questions[questionIndex]
        let answers = currentQuestion.answers
        let progress = Float(questionIndex)/Float(questions.count)
        
        progressView.setProgress(progress, animated: true)
        labelForQuestion.text = currentQuestion.question
        
        switch currentQuestion.type {
        case .typeForQuestionFirst:
            updateForFirstQuestion(with: answers)
        case .typeForQuestionSecond:
            updateForSecondQuestion(with: answers)
        case .typeForQuestionThird:
            updateForThirdQuestion(with: answers)
        }
        
    }
    
    private func updateForFirstQuestion (with answers: [Answer]) {
        questionFirst.isHidden = false
        for (button, answer) in zip(buttonsForFirstQuestion, answers)
        { button.setTitle(answer.text, for: [])
        }
        
    }
    
    private func updateForSecondQuestion (with answers: [Answer]) {
        questionSecond.isHidden = false
        for (label, answer) in zip(labelsForSecondQuestion, answers) {
            label.text = answer.text
        }
        
    }
    
    private func updateForThirdQuestion (with answers: [Answer]) {
        questionThird.isHidden = false
        labelsForThirdQuestion.first?.text = answers[1].text
        labelsForThirdQuestion.last?.text = answers.first?.text
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {update()}
        else {
            performSegue(withIdentifier: "ResultSegue" , sender: nil)}
        
    }
    
    // MARK: - IBActions
    
    @IBAction func firstsButtonPressed(_ sender: UIButton) {
        guard let answerIndex = buttonsForFirstQuestion.firstIndex(of: sender) else {return}
        let answer = questions[questionIndex].answers[answerIndex]
        answerChose.append(answer)
        nextQuestion()
    }
    
    @IBAction func secondButtonPressed(_ sender: UIButton) {
        for index in 0...3 {if switchs[index].isOn == true {
            let answer = questions[questionIndex].answers[index]
            answerChose.append(answer)
            }
            
        }
        
        nextQuestion()
        
    }
    
    @IBAction func ThirdButtonPressed(_ sender: UIButton) {
        switch slider.value {
        case 1000000...1499999:
            answerChose.append(questions[questionIndex].answers[0])
        case 1500000...3999999:
            answerChose.append(questions[questionIndex].answers[1])
        case 4000000...9999999:
            answerChose.append(questions[questionIndex].answers[2])
        case 9999999...10000000:
            answerChose.append(questions[questionIndex].answers[3])
        default:
            break
        }
        
        nextQuestion()
        
    }
    
}
