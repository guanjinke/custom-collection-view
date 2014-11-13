//
//  MyLayout.swift
//  test13
//
//  Created by Thomas Liu on 11/11/14.
//  Copyright (c) 2014 guanjinke. All rights reserved.
//

import UIKit

class MyLayout: UICollectionViewLayout {
    var sectionNumber = 0
    
    var titleWidth : CGFloat = 120.0
    var lineSpacing : CGFloat = 10.0
    var minimumItemSpacing : CGFloat = 10
    var itemHeight: CGFloat = 80
    var itemWidth: CGFloat = 80
    var numberOfItmInLine: Int = 0
    var totalWidth :CGFloat = 0.0
    var concreteItemSpacing : CGFloat = 0.0
    var leftPadding:CGFloat = 250
    var footerHeight: CGFloat  = 10
    
    override func prepareLayout() {
        super.prepareLayout()
        sectionNumber = collectionView!.numberOfSections()
        totalWidth = collectionView!.frame.size.width
        numberOfItmInLine = Int((totalWidth - minimumItemSpacing - leftPadding) / (itemWidth + minimumItemSpacing))
        concreteItemSpacing = (totalWidth - leftPadding - (CGFloat(numberOfItmInLine) * itemWidth)) / CGFloat(numberOfItmInLine + 1)
    }
    
    override func collectionViewContentSize() -> CGSize {
        var maxHeight : CGFloat = 0.0
        for var i = 0; i < sectionNumber ; i++ {
            maxHeight += getSectionHeight(i)
        }
        return CGSizeMake(totalWidth, maxHeight)
    }
    
    func getSectionHeight(section:Int ) -> CGFloat {
        let cellCount = collectionView!.numberOfItemsInSection(section)
        var lineCountInSection = ceil( Double(cellCount) / Double(numberOfItmInLine))
        let sectionHeight = lineSpacing + CGFloat(lineCountInSection ) * (itemHeight + lineSpacing) + 10
        
        return sectionHeight
    }
    
    func getSectionTop(section: Int) ->CGFloat{
        var height : CGFloat = 0
        for var i = 0 ; i < section ; i++ {
            height += getSectionHeight(i)
        }
        
        return height
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        var result = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        var lineIndex = indexPath.item / numberOfItmInLine
        var itemIndex = indexPath.item % numberOfItmInLine
        var currentSectionTop = getSectionTop(indexPath.section)
        result.frame = CGRectMake(leftPadding + concreteItemSpacing + CGFloat(itemIndex) * ( itemHeight + concreteItemSpacing), currentSectionTop + lineSpacing + CGFloat(lineIndex) * (itemHeight + lineSpacing), itemWidth, itemHeight)
        //NSLog("%@,%@" , result.frame.origin.x,result.frame.origin.y)
        return result
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var result = [AnyObject]()
        for var i = 0 ; i < sectionNumber; i++ {
            var cellCount = collectionView!.numberOfItemsInSection(i)
            for var j = 0 ; j < cellCount ; j++ {
                var path = NSIndexPath(forItem: j, inSection: i)
                result.append(layoutAttributesForItemAtIndexPath(path))
            }
            
            result.append(layoutAttributesForSupplementaryViewOfKind("head", atIndexPath:NSIndexPath(forItem: 0, inSection: i)))
             result.append(layoutAttributesForSupplementaryViewOfKind("foot", atIndexPath:NSIndexPath(forItem: 0, inSection: i)))
            
        }
        
        return result
    }
    
    override func layoutAttributesForSupplementaryViewOfKind(elementKind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        var result = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, withIndexPath: indexPath)
        var currentSectionTop = getSectionTop(indexPath.section)
        var currentSectionheight = getSectionHeight(indexPath.section)
        
        if elementKind == "head" {
            result.frame = CGRectMake(0, currentSectionTop, leftPadding, currentSectionheight)
        }else {
            result.frame = CGRectMake(20, currentSectionTop + currentSectionheight - footerHeight, totalWidth - 20 * 2, footerHeight)
        }
        return result
    }
}
