//
//  ViewController.swift
//  testOne
//
//  Created by Apple on 7/26/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftSlider: UISlider?
    @IBOutlet weak var rightSlider: UISlider?
    @IBOutlet weak var leftText: UILabel?
    @IBOutlet weak var rightText: UILabel?
    var changeTimer: Timer?
    var time: Double = 0
    var dt: Double = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftText?.text = "Hello World"
        changeTimer = Timer(fireAt: Date.init(), interval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats:true)
        RunLoop.main.add(changeTimer!, forMode: RunLoopMode.commonModes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func update() {
        time = time + dt
        leftSlider?.value = Float((sin(time) + 1) / 2.0)
        rightSlider?.value = Float((cos(time) + 1) / 2.0)
        sliderDidChange(sender: leftSlider!)
        sliderDidChange(sender: rightSlider!)
    }
    
    @IBAction func sliderDidChange(sender: UISlider) {
        if(sender == leftSlider)
        {
            leftText?.text = String( sender.value)
        }
        else if(sender == rightSlider)
        {
            rightText?.text = String(sender.value)
        }
        //print("Slider Change")
    }


}

