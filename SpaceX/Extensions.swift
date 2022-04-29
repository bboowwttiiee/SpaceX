//
//  Extensions.swift
//  SpaceX
//
//  Created by bowtie on 19.04.2022.
//

import SwiftUI

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> String {
        let parsedDate = DateFormatter.allNumericUSA.date(from: self) ?? Date()
        let dateToString = DateFormatter.allNumericUSA.string(from: parsedDate)
        return dateToString
    }
}
