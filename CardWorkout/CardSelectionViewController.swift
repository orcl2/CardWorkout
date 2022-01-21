//
//  CardSelectionViewController.swift
//  CardWorkout
//
//  Created by William Daniel da Silva Kuhs on 05/01/22.
//

import UIKit

class CardSelectionViewController: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        startTimer()
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func setupButtons() {
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
