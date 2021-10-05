//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Kyle Lei on 2021/10/3.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var opponentSignLabel: UILabel! {
        didSet{
            opponentSignLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var playerSignLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    var opponentScore = 0
    var playerScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rockButton.tag = 1
        paperButton.tag = 2
        scissorsButton.tag = 3
        
        updateUI(forstate: .start)
        opponentScoreLabel.isHidden = true
        playerScoreLabel.isHidden = true
    }
    
    @IBAction func gestureSelected(_ sender: UIButton) {
        
        switch Sign(rawValue: sender.tag) {
        case .scissors:
            play(userSign: .scissors)
        case .rock:
            play(userSign: .rock)
        case .paper:
            play(userSign: .paper)
        case .none:
            break
        }
        changeToStart()
    }
               
    func updateUI(forstate state: GameState) {
        gameStateLabel.text = state.status
        opponentScoreLabel.isHidden = false
        playerScoreLabel.isHidden = false
        
        switch state {
        case .start:
            let defaultSign: Sign = .rock
            opponentSignLabel.text = defaultSign.emoji
            playerSignLabel.text = defaultSign.emoji
            changeButtonState(isEnable: true)
            gameStateLabel.textColor = .darkGray

        case .win:
            playerScore += 1
            changeButtonState(isEnable: false)
            gameStateLabel.textColor = .green
        case .lose:
            opponentScore += 1
            changeButtonState(isEnable: false)
            gameStateLabel.textColor = .orange
        case .draw:
            changeButtonState(isEnable: false)
            gameStateLabel.textColor = .lightGray
        }
        opponentScoreLabel.text = String(opponentScore)
        playerScoreLabel.text = String(playerScore)
    }
    
    func play(userSign: Sign) {
        let opponentSign = randomSign()
        opponentSignLabel.text = opponentSign.emoji
        
        playerSignLabel.text = userSign.emoji
        
        let gameState = userSign.gameState(against: opponentSign)
        updateUI(forstate: gameState)
    }
    
    func changeToStart() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.updateUI(forstate: .start)
        }
    }
    
    func changeButtonState(isEnable bool:Bool) {
        scissorsButton.isEnabled = bool
        rockButton.isEnabled = bool
        paperButton.isEnabled = bool
    }
}

