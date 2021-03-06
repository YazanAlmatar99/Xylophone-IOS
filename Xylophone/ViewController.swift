//
//  ViewController.swift
//  Xylophone
//Yazan Almatar 2020


import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func playSound(file:String) {
          guard let url = Bundle.main.url(forResource: "\(file)", withExtension: "wav") else { return }

          do {
              //the following two statements will make sure to play the sound eventhough the phone is on silent
              try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
              try AVAudioSession.sharedInstance().setActive(true)

              /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
              player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

              /* iOS 10 and earlier require the following line:
              player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

              guard let player = player else { return }

              player.play()

          } catch let error {
              print(error.localizedDescription)
          }
      }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(file:sender.currentTitle!)
        print(sender.currentTitle!)
        sender.setTitleColor(.black, for: .normal)
        sender.alpha = 0.5
           //Code should execute after 0.2 second delay.
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
           //Bring's sender's opacity back up to fully opaque.
           sender.alpha = 1.0
            sender.setTitleColor(.white, for: .normal)

    }
    
  

}

}
