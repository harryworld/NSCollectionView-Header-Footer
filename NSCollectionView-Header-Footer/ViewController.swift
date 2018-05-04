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
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath)
        
        return item
    }
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        var nibName: String?
        if kind == NSCollectionView.SupplementaryElementKind.sectionHeader {
            nibName = "Header"
        } else if kind == NSCollectionView.SupplementaryElementKind.sectionFooter {
            nibName = "Footer"
        }
        let view = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: nibName!), for: indexPath)
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.green.cgColor
        
        if let view = view as? HeaderView {
            view.titleTextField?.stringValue = "Custom Header"
        } else if let view = view as? FooterView {
            view.titleTextField?.stringValue = "Custom Footer"
        }
        return view
    }
    
}

extension ViewController: NSCollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 100, height: 50)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSSize(width: 0, height: 20)
    }
    
}
