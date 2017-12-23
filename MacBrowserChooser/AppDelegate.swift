//
//  AppDelegate.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 23/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let menu = NSMenu()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.menu = menu
        statusItem.button?.image = NSImage(named:NSImage.Name("menuBarIcon"))
        menu.addItem(NSMenuItem(title: "Quit",
                                action: #selector(NSApplication.terminate(_:)),
                                keyEquivalent: ""))
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
