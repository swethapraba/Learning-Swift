//
//  ViewController.swift
//  Changing Balance
//
//  Created by Apple on 7/27/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    @IBOutlet weak var leftLabel: UILabel? // left (top) label
    @IBOutlet weak var balanceLabel: UILabel? //middle label
    @IBOutlet weak var rightLabel: UILabel? //right (bottom) label
    @IBOutlet var picture: UIImageView? // Double check this sucker
    var timer: Timer?
    var time: Double = 0 //still not entirely sure what this does
    var dt: Double = 1//0.1 //the interval
    
    var left: Float = 0
    var right: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("VIEW LOADED")
        timer = Timer(fireAt: Date.init(), interval: dt, target: self, selector: #selector(update), userInfo: nil, repeats: true) //timer
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes) //???? ask Matt about this line
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() //update the labels so that the pictures can be updated
    {
        time = time + dt//increment time
        left = Float((sin(time) + 1) / 2.0) //change value to out of [0,1] (instead of [-1,1])
        right = Float((cos(time) + 1) / 2.0) //same thing but cos for the right slider
        leftLabel?.text = String(left)
        rightLabel?.text = String(right)
        if(left > right)
        {
            valuesChanged(sender: leftLabel!)
        }
        else if(right > left)
        {
            valuesChanged(sender: rightLabel!)
        }
        else
        {
            valuesChanged(sender: balanceLabel!)
        }

    }
    @IBAction func valuesChanged(sender: UILabel)
    {
        if(sender == leftLabel)
        {
            print("LEFT IS HEAVIER")
            
            self.picture?.image = UIImage(named: "leftTiltScale.jpg")
            
            leftLabel?.isHidden = false //show the labels (with values)
            balanceLabel?.isHidden = true //hide the message that you're balanced
            rightLabel?.isHidden = false //show the labels with the values
            
        }
        else if (sender == rightLabel)
        {
            print ("RIGHT IS HEAVIER")
            
            self.picture?.image = UIImage(named: "rightTiltScale.jpg")
            
            leftLabel?.isHidden = false //show the labels with values
            balanceLabel?.isHidden = true //hide the message that you're balanced
            rightLabel?.isHidden = false //show the labels with the values
        }
        else if (sender == balanceLabel)
        {
            //some code
            print("You're balanced!")
            
            self.picture?.image = UIImage(named: "balancedScale.jpg")
            self.picture?.layer.borderWidth = 2
            self.picture?.layer.borderColor = UIColor.black().cgColor //figure out stuff for our shade of pink
            
            leftLabel?.isHidden = true //maybe hide the values since you're now balanced???
            balanceLabel?.text = "You're balanced"
            rightLabel?.isHidden = true
        }
        else
        {
            print("Something's wrong")
            self.picture?.image = UIImage(named: "FinalGradientSize3_850.png")
        }
    }

}

