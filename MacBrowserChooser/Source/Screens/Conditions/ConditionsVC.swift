//
//  ConditionsVC.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 25/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Cocoa

class ConditionsVC: NSViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var predicateEditor: NSPredicateEditor!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        predicateEditor.canRemoveAllRows = false
        predicateEditor.addRow(nil)
    }
    
    // MARK: - Actions

    @IBAction func clickedOkButton(_ sender: NSButton) {
        dismiss(nil)
    }
}
