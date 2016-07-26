//
//  ColorView.swift
//  testTwo
//
//  Created by Apple on 7/26/16.
//  Copyright © 2016 Apple Warriors. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics
class ColorView: UIView
{
    var color : UIColor = UIColor.black()
    let radius: CGFloat = 100.0
    override func draw(_ rect: CGRect)
    {
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        let x = self.bounds.size.width/2.0 - radius
        let y = self.bounds.size.height/2.0 - radius
        ctx.addEllipse(inRect: CGRect(x: x, y: y, width: radius*2.0, height: radius*2.0))
        ctx.setFillColor(color.cgColor)
        ctx.fillPath()
    }
}
