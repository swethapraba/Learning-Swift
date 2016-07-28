//
//  ViewController.swift
//  CircleSliders
//
//  Created by Apple on 7/28/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dialPlacement: UIView?
    @IBOutlet var label: UILabel?
    var dial : CircularKnobs?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dial = CircularKnobs(frame: knobPlaceholder.bounds)
        knobPlaceholder.addSubview(dial)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

