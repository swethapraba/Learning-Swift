//
//  ViewController.swift
//  testOne
//
//  Created by Apple on 7/26/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //? vs !
    @IBOutlet weak var leftSlider: UISlider? //the left (Top) slider
    @IBOutlet weak var rightSlider: UISlider? //the right (bottom) slider
    @IBOutlet weak var leftText: UILabel? // left side label for data
    @IBOutlet weak var rightText: UILabel? //right side label for data
    var changeTimer: Timer? //the timer
    var time: Double = 0 // don't remember what this does
    var dt: Double = 0.1 // the interval
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftText?.text = "Hello World" //just set the label text
        changeTimer = Timer(fireAt: Date.init(), interval: dt, target: self, selector: #selector(update), userInfo: nil, repeats:true) //timer stuff
        RunLoop.main.add(changeTimer!, forMode: RunLoopMode.commonModes) //some loop?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() //update sliders based on the sin curves
    {
        time = time + dt //increment time
        leftSlider?.value = Float((sin(time) + 1) / 2.0) //change value to out of [0,1] (instead of [-1,1])
        rightSlider?.value = Float((cos(time) + 1) / 2.0) //same thing but cos for the right slider
        sliderDidChange(sender: leftSlider!) //call function to set labels
        sliderDidChange(sender: rightSlider!) //call functions to set labels
    }
    
    @IBAction func sliderDidChange(sender: UISlider) //when the Slider changes, change text
    {
        if(sender == leftSlider) //self-explanatory
        {
            leftText?.text = String( sender.value) //set left text to be the value for the time
        }
        else if(sender == rightSlider)
        {
            rightText?.text = String(sender.value) //see above
        }
    }


}

