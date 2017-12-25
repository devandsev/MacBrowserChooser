//
//  RulesService.swift
//  MacBrowserChooser
//
//  Created by Andrey Sevrikov on 25/12/2017.
//  Copyright © 2017 devandsev. All rights reserved.
//

import Cocoa

protocol HasRulesService {
    var rulesService: IRulesService { get }
}

protocol IRulesService {
    var rules: [Rule] { get set }
}

class RulesService: IRulesService {
    
    var rules: [Rule] = []
}
