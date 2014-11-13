//
//  CollectionFooterView.swift
//  test13
//
//  Created by Thomas Liu on 11/13/14.
//  Copyright (c) 2014 guanjinke. All rights reserved.
//

import UIKit

class CollectionFooterView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor =  UIColor.whiteColor()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        UIColor.grayColor().set()
        var context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2)
        CGContextMoveToPoint(context, 0, rect.height/2)
        CGContextAddLineToPoint(context, rect.width, rect.height/2)
        CGContextStrokePath(context)
    }
}
