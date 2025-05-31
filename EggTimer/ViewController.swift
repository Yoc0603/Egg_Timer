
import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var progresBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Yumusak": 3, "Orta": 6, "Sert": 9]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progresBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progresBar.progress = Float(secondsPassed) / Float(totalTime)

        } else{
            timer.invalidate()
            titleLabel.text = "BITTI!"
        }
    }

}
