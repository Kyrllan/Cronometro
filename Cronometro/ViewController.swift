//
//  ViewController.swift
//  Cronometro
//
//  Created by Kyrllan Nogueira on 07/09/17.
//  Copyright © 2017 Kyrllan Nogueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func timerStart(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
            self.startButton.isEnabled = false
        }
        
    }
    
    @IBAction func timerPause(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            isTimerRunning = false
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume", for: .normal)
        }else{
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.pauseButton.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func timerReset(_ sender: Any) {
        timer.invalidate()
        seconds = 120
        timerLabel.text = timerString(time: TimeInterval(seconds))
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    var seconds = 120
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    func timerString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.isEnabled = true
    }
    
    func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
        }else{
        seconds -= 1
        timerLabel.text = timerString(time: TimeInterval(seconds))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseButton.isEnabled = false

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

