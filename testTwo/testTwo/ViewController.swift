//
//  ViewController.swift
//  testTwo
//
//  Created by Apple on 7/26/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var blueButton: UIButton?
    @IBOutlet weak var greenButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: UIButton)
    {
        var colorViewController = UIViewController()
        var colorView = ColorView(frame: self.view.frame)
        
        if(sender == blueButton)
       {
         colorView.color = UIColor.blue()
       }
        else if(sender == greenButton)
       {
         colorView.color = UIColor.green()
       }
        colorViewController.view = colorView
        self.navigationController!.pushViewController( colorViewController, animated: true )
    }
}

