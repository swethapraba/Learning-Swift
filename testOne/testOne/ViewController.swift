//  ViewController.swift
//  testOne
//  Created by Apple on 7/26/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SliderValuesDelegate {
    //? vs !
    @IBOutlet weak var leftSlider: UISlider? //the left (Top) slider
    @IBOutlet weak var leftText: UILabel? // left side label for data
    var values = SliderValues()
    
    @IBOutlet weak var rightSlider: UISlider? //the right (bottom) slider
    @IBOutlet weak var rightText: UILabel? //right side label for data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftText?.text = "Hello World" //just set the label text
        
        update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update()
    {
        values.delegate = self
        values.updateTime()
//        sliderDidChange(sender: leftSlider!) //call function to set labels
//        updateValues(rightSlider)
//        rightSlider?.value = Float((cos(time) + 1) / 2.0) //same thing but cos for the right slider
//        sliderDidChange(sender: rightSlider!) //call functions to set labels

    }
    
    func didUpdate(leftValue: Double)
    {
        leftSlider?.value = Float(leftValue)
        leftText?.text = String(leftValue)
    }
    func didUpdate(rightValue: Double)
    {
        rightSlider?.value = Float(rightValue)
        rightText?.text = String(rightValue)
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

