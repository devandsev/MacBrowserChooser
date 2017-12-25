//
//  SystemBrowserService.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 23/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Foundation

protocol HasSystemBrowserService {
    var systemBrowserService: ISystemBrowserService { get }
}

protocol ISystemBrowserService {
    var isDefault: Bool { get }
    func setAsDefault()
    func setSafariAsDefault()
}

class SystemBrowserService: ISystemBrowserService {
    
    var isDefault: Bool {
        guard let defaultBundleId = LSCopyDefaultHandlerForURLScheme("http" as CFString)?.takeRetainedValue() as? String,
        let bundleId = Bundle.main.bundleIdentifier,
        defaultBundleId.lowercased() == bundleId.lowercased() else {
            return false
        }
        
        return true
    }
    
    func setAsDefault() {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return
        }
        
        LSSetDefaultHandlerForURLScheme("http" as CFString, bundleIdentifier as CFString)
    }
    
    func setSafariAsDefault() {
        LSSetDefaultHandlerForURLScheme("http" as CFString, "com.apple.safari" as CFString)
    }
    
    func bundleIdentifierForDefault() -> String? {
        return LSCopyDefaultHandlerForURLScheme("http" as CFString)?.takeRetainedValue() as? String
    }
    
    func bundleIdentifiers() -> [String] {
        guard let ids = LSCopyAllHandlersForURLScheme("http" as CFString)?.takeRetainedValue() as? [String] else {
            return []
        }
        
        return ids
    }
    
    func browsersPaths() -> [URL] {
        let ids = bundleIdentifiers()
        
        return ids.flatMap { self.paths(for: $0).first }
    }
    
    func paths(for bundleIdentifier: String) -> [URL] {
        guard let paths = LSCopyApplicationURLsForBundleIdentifier(bundleIdentifier as CFString, nil)?.takeRetainedValue() as? [URL] else {
            return []
        }
        
        return paths
    }
}
