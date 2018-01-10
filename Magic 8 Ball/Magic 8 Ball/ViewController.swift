//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Ricardo Wiggins on 1/9/18.
//  Copyright © 2018 Ricardo Wiggins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomBallNumber : Int = 0

    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UpdateBallImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func AskButtonPressed(_ sender: Any) {
        UpdateBallImage()
    }
    
    func UpdateBallImage() {
        randomBallNumber = Int(arc4random_uniform(4))
        ImageView.image = UIImage(named: ballArray[randomBallNumber])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        UpdateBallImage()
    }
}

