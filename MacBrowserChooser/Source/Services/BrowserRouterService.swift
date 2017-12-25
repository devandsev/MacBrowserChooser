//
//  BrowserRouterService.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 25/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Cocoa

protocol HasBrowserRouterService {
    var browserRouterService: IBrowserRouterService { get }
}

protocol IBrowserRouterService {
    func handle(url: String)
}

class BrowserRouterService: IBrowserRouterService, HasDependencies {
    
    // MARK: - Dependencies
    
    typealias Dependencies = HasRulesService
    lazy var di: Dependencies = DI.dependencies
    
    let safariBundleId = "com.apple.Safari"
    
    func handle(url: String) {
        let bundleId = bundle(for: url)
        
        if !open(url: url, bundleId: bundleId) {
            open(url: url, bundleId: safariBundleId)
        }
    }
    
    private func bundle(for url: String) -> String {
        if url.range(of: ".ru") != nil {
            return "com.apple.Safari"
        } else {
            return "com.google.Chrome"
        }
    }
    
    @discardableResult
    private func open(url: String, bundleId: String) -> Bool {
        guard let url: URL = URL(string: url) else {
            return false
        }
        
        return NSWorkspace.shared.open(
            [url],
            withAppBundleIdentifier: bundleId,
            options: NSWorkspace.LaunchOptions.default,
            additionalEventParamDescriptor: nil,
            launchIdentifiers: nil
        )
    }
}
