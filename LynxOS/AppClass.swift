//
//  AppClass.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import Foundation

class App {
    
    private var _appName: String
    private var _appIconImage: String
    private var _destination: String
    
    var appName: String {
        return _appName
    }
    
    var appIconImage: String {
        return _appIconImage
    }
    
    var destination: String {
        return _destination
    }
    
    init(appName: String, appIconImage: String, destination: String) {
        _appName = appName
        _appIconImage = appIconImage
        _destination = destination
    }
}
