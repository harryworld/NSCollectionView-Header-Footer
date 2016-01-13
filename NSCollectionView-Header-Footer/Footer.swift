//
//  Footer.swift
//  NSCollectionView-Header-Footer
//
//  Created by Harry Ng on 13/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class Footer: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.greenColor().CGColor
    }
    
}
