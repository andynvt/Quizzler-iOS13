//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by ANDY on 13/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPress(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        
        if isCorrect {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answers = quizBrain.getAnswer()
        firstButton.setTitle(answers[0], for: .normal)
        secondButton.setTitle(answers[1], for: .normal)
        thirdButton.setTitle(answers[2], for: .normal)
        
        firstButton.backgroundColor = .clear
        secondButton.backgroundColor = .clear
        thirdButton.backgroundColor = .clear
    }
    

}

