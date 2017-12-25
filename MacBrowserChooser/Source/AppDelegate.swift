//
//  AppDelegate.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 23/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, HasDependencies {

    // MARK: - Dependencies
    
    typealias Dependencies = HasSystemBrowserService & HasBrowserRouterService
    var di: Dependencies! = DI.dependencies
    
    // MARK: - Properties
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let menu = NSMenu()

    // MARK: - Lifecycle
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Menu
        statusItem.menu = menu
        statusItem.button?.image = NSImage(named:NSImage.Name("menuBarIcon"))
        menu.addItem(NSMenuItem(title: "Quit",
                                action: #selector(NSApplication.terminate(_:)),
                                keyEquivalent: ""))
        
        // Browsers
        di.systemBrowserService.setAsDefault()
        
        NSAppleEventManager.shared().setEventHandler(self,
                                                     andSelector: #selector(self.getUrl(_:withReplyEvent:)),
                                                     forEventClass: AEEventClass(kInternetEventClass),
                                                     andEventID: AEEventID(kAEGetURL))
    }

    @objc func getUrl(_ event: NSAppleEventDescriptor,
                      withReplyEvent replyEvent: NSAppleEventDescriptor) {
        
        guard let urlString: String = event.paramDescriptor(forKeyword: keyDirectObject)?.stringValue else {
            return
        }
        
        di.browserRouterService.handle(url: urlString)
    }
}
