//
//  ViewController.swift
//  RPS
//
//  Created by mac on 11.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotsLabel: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgaineButton: UIButton!
    
    
    @IBAction func rockButton(_ sender: Any) {
        play(sign: .rock)
    }
    
    @IBAction func paperButton(_ sender: Any) {
        play(sign: .paper)
    }
    @IBAction func scissorsButton(_ sender: Any) {
        play(sign: .scissors)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        updateState(state: .start)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateState(state: .start)
    }


    func updateState (state: GameState) {
        switch state {
        case .start:
            gameStatus.text = "Start!"
            robotsLabel.text = "🤖"
            playAgaineButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        case .win:
            gameStatus.text = "Победа!"
        case .draw:
            gameStatus.text = "Ничья"
        case .lose:
            gameStatus.text = "Проигрышь"
        }
    }
    
    func play(sign: Sign) {
        let robotSign = randomSign()
        let result = sign.compareWith(robotSign)
        updateState(state: result)
        robotsLabel.text = robotSign.emoji
//        rockButton.isEnabled = false
//        paperButton.isEnabled = false
//        scissorsButton.isEnabled = false
//
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            rockButton.isEnabled = false
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
            paperButton.isEnabled = false
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            scissorsButton.isEnabled = false
        }
        playAgaineButton.isHidden = false
        
    }
}

