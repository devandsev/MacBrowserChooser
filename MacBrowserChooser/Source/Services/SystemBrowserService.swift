//
//  SystemBrowserService.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 23/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Foundation

class SystemBrowserService {
    
    func setAsDefault() {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return
        }
        
        LSSetDefaultHandlerForURLScheme("http" as CFString, bundleIdentifier as CFString)
    }
}
