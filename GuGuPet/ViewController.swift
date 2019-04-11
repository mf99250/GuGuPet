//
//  ViewController.swift
//  GuGuPet
//
//  Created by User19 on 2019/4/11.
//  Copyright © 2019 Starmy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var pitchSlide: UISlider!
    @IBOutlet weak var speedSlide: UISlider!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var mySentense: UITextField!
    
    var sentense: String = "你個大撒子"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pitchLabel.text = String(format: "%.1f", (pitchSlide.value*1.5)+0.5)
        speedLabel.text = String(format: "%.1f", speedSlide.value)
        
    }
    @IBAction func pitch(_ sender: UISlider) {
        pitchLabel.text = String(format: "%.1f", (pitchSlide.value*1.5)+0.5)
    }
    @IBAction func speed(_ sender: UISlider) {
        speedLabel.text = String(format: "%.1f", speedSlide.value)
    }
    
    @IBAction func image1(_ sender: UIButton) {
        bigImage.image = UIImage(named: "fungi");
    }
    @IBAction func image2(_ sender: UIButton) {
        bigImage.image = UIImage(named: "rabbit");
    }
    @IBAction func image3(_ sender: UIButton) {
        bigImage.image = UIImage(named: "dream");
    }
    
    @IBAction func randomSentense(_ sender: UISwitch) {
        if(sender.isOn){
            var number = Int.random(in: 0...2)
            number = Int.random(in: 0...2)
            if(number==0){
                sentense = "你好"
            }
            else if(number==1){
                sentense = "hello, how are you."
            }
            else{
                sentense = "你叫什麼名字"
            }
        }
        else{
            sentense = mySentense.text!
        }
    }
    
    @IBAction func trainingButton(_ sender: UIButton){
        let speechUtterance = AVSpeechUtterance(string: sentense)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtterance.pitchMultiplier = pitchSlide.value
        speechUtterance.rate = speedSlide.value
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }}
