//
//  RulesVC.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 25/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Cocoa

class RulesVC: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // MARK: - Actions
    
    @IBAction func clickedAddButton(_ sender: NSButton) {
        let vc = ConditionsVC(nibName: NSNib.Name(rawValue: "ConditionsVC"), bundle: nil)
        presentViewControllerAsSheet(vc)
    }
}
