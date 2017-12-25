//
//  Dependencies.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 25/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Foundation

protocol HasDependencies: class {
    associatedtype Dependencies
    
    var di: Dependencies { get set }
}

struct Dependencies: HasSystemBrowserService, HasBrowserRouterService, HasRulesService {
    
    var systemBrowserService: ISystemBrowserService
    var browserRouterService: IBrowserRouterService
    var rulesService: IRulesService
    
    func resolveInternalDependencies() {
    }
}

class DI {
    
    static let dependencies: Dependencies = appDependencies
    
    private static let appDependencies: Dependencies = {

        let d = Dependencies(systemBrowserService: SystemBrowserService(),
                             browserRouterService: BrowserRouterService(),
                             rulesService: RulesService())
        
        d.resolveInternalDependencies()
        
        return d
    }()
}
