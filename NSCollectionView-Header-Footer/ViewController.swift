//
//  ViewController.swift
//  NSCollectionView-Header-Footer
//
//  Created by Harry Ng on 13/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: NSCollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: NSCollectionView) -> Int {
        return 5
    }
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItemWithIdentifier("CollectionViewItem", forIndexPath: indexPath)
        
        return item
    }
    
    func collectionView(collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> NSView {
        var nibName: String?
        if kind == NSCollectionElementKindSectionHeader {
            nibName = "Header"
        } else if kind == NSCollectionElementKindSectionFooter {
            nibName = "Footer"
        }
        let view = collectionView.makeSupplementaryViewOfKind(kind, withIdentifier: nibName!, forIndexPath: indexPath)
        
        if let view = view as? HeaderView {
            view.titleTextField?.stringValue = "Custom Header"
        } else if let view = view as? FooterView {
            view.titleTextField?.stringValue = "Custom Footer"
        }
        return view
    }
    
}

extension ViewController: NSCollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> NSSize {
        return NSSize(width: 100, height: 50)
    }
    
    func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
    
    func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
    
}
