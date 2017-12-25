//
//  GeneralViewController.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 25/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Cocoa

class GeneralVC: NSViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var isDefaultCheckmarkButton: NSButton!
    
    let ix = GeneralIX()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        ix.output = self
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        ix.startTrackingSettings()
    }
    
    override func viewDidDisappear() {
        super.viewDidDisappear()
        
        ix.stopTrackingSettings()
    }
    
    // MARK: - Actions
    
    @IBAction func clickedDefaultCheckmarkButton(_ sender: NSButton) {
        ix.switchDefaultBrowser()
    }
}

extension GeneralVC: GeneralIXOutput {
    
    func didUpdateData() {
        isDefaultCheckmarkButton.state = ix.vm.isDefaultBrowser ? .on : .off
    }
}
