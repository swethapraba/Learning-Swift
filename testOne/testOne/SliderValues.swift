//
//  SliderValues.swift
//  testOne
//
//  Created by Apple on 7/29/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.

import Foundation
import UIKit
import CoreGraphics

protocol SliderValuesDelegate: AnyObject {
    func didUpdate(leftValue: Double);
    func didUpdate(rightValue: Double);
}

class SliderValues
{
    weak var delegate: SliderValuesDelegate?
    var changeTimer: Timer? //the timer
    var time: Double = 0 // don't remember what this does
    var dt: Double = 0.1 // the interval
    
    func updateTime() //update sliders based on the sin curves
    {
        changeTimer = Timer(fireAt: Date.init(), interval: dt, target: self, selector: #selector(updateValue(timer:)), userInfo: nil, repeats:true) //timer stuff
        RunLoop.main.add(changeTimer!, forMode: RunLoopMode.commonModes) //some loop?
    }
    
    @objc func updateValue(timer: Timer)
    {
        time = time + dt //increment time
        let numberL = (sin(time) + 1) / 2.0 //change value to out of [0,1] (instead of [-1,1])
        let numberR = (cos(time) + 1) / 2.0 //change value to out of [0,1] (instead of [-1,1])
        delegate?.didUpdate(leftValue: numberL)
        delegate?.didUpdate(rightValue: numberR)
    }

}
