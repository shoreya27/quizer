//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    

    var quiz = quizBrain()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        // Do any additional setup after loading the view.
        questionLabel.text = self.quiz.getQuestionText()
        progressBar.progress = 0.0
        scoreLabel.text = "Score: \(self.quiz.getScore())"
        }

    @IBAction func anserButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
        let userGotItRight = quiz.checkUserAnser(userAnswer)
        
        //If user got it right
        //mark sender button color to green
        //mark sender button color to red
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        //increment the question number
        quiz.nextQuestion()

        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
            self.questionLabel.text = self.quiz.getQuestionText()
            self.progressBar.progress = self.quiz.getProgressBarVal()
            self.scoreLabel.text = "Score: \(self.quiz.getScore())"
        }
    }

}

