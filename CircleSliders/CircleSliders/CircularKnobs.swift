//
//  CircularKnobs.swift
//  CircleSliders
//
//  Created by Apple on 7/28/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import UIKit

public class CircularKnobs: UIControl
{
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        backgroundColor = tintColor
    }
    
    public required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
