//
//  GeneralIX.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 25/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Foundation

protocol GeneralIXOutput: class {
    func didUpdateData()
}

class GeneralIX: HasDependencies {
    
    // MARK: - Dependencies
    
    typealias Dependencies = HasSystemBrowserService
    var di: Dependencies! = DI.dependencies
    
    // MARK: Properties
    
    weak var output: GeneralIXOutput?
    
    let vm = GeneralVM()
    
    var timer: Timer?
    
    // MARK: - Public
    
    func startTrackingSettings() {
        synchronizeSettings()
        
        let timer = Timer(timeInterval: 1.0, repeats: true) { [weak self] timer in
            self?.synchronizeSettings()
        }
        
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        self.timer = timer
        
    }
    
    func stopTrackingSettings() {
        timer?.invalidate()
        timer = nil
    }
    
    func synchronizeSettings() {
        vm.isDefaultBrowser = di.systemBrowserService.isDefault
        output?.didUpdateData()
    }
    
    func switchDefaultBrowser() {
        if vm.isDefaultBrowser {
            di.systemBrowserService.setSafariAsDefault()
        } else {
            di.systemBrowserService.setAsDefault()
        }
    }
}
