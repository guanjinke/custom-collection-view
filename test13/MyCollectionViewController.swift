//
//  CollectionViewController.swift
//  test13
//
//  Created by Thomas Liu on 11/11/14.
//  Copyright (c) 2014 guanjinke. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"
let reuseHeaderIdentifier = "head"
let reuseFooterIdentifier = "foot"

class MyCollectionViewController: UICollectionViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        var nib = UINib(nibName: "MyCell", bundle: nil)
        var nib1 = UINib(nibName: "CollectionHeaderView", bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.registerNib(nib1, forSupplementaryViewOfKind: "head", withReuseIdentifier: reuseHeaderIdentifier)
        self.collectionView.registerClass(CollectionFooterView.self, forSupplementaryViewOfKind: "foot", withReuseIdentifier: reuseFooterIdentifier)
        self.collectionView.backgroundColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 3
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 18
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as MyCell
        
        // Configure the cell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        //cell.layer.borderWidth = 2
        //cell.layer.borderColor = UIColor.redColor().CGColor
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == "head" {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:reuseHeaderIdentifier, forIndexPath: indexPath) as CollectionHeaderView
            header.textLabel.text = String(format: "Section %d", indexPath.section)
            return header
        }else {
            return collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseFooterIdentifier, forIndexPath: indexPath) as UICollectionReusableView
        }
    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
