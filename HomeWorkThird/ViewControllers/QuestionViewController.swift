//
//  QuestionViewController.swift
//  HomeWorkThird
//
//  Created by Магомед Абдуразаков on 30/06/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var score = 0
    
    @IBOutlet var progress: UIProgressView!
    @IBOutlet var labelForQuestion: UILabel!
    @IBOutlet var questionOne: UIStackView!
    @IBOutlet var questionSecond: UIStackView!
    @IBOutlet var questionThird: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        
    }
    
    func update() {
        questionOne.isHidden = true
        questionSecond.isHidden = true
        questionThird.isHidden = true
    }
    
    
    @IBAction func resultButtonPressed(_ sender: UIBarButtonItem) {
        
        update()
        
        switch score {
        case 0:
            questionOne.isHidden = false
        case 1:
            questionSecond.isHidden = false
        case 2:
            questionThird.isHidden = false
        default:
            performSegue(withIdentifier: "ResultSegue" , sender: nil)
        }
        
        score += 1
        
    }
    
    
    
    
}
