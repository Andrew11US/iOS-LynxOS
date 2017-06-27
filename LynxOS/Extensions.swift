//
//  Extensions.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import Foundation

extension Date {
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
    }
}
