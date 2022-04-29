//
//  LaunchModel.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

// MARK: - LAUNCH MODEL
struct Launch: Codable, Identifiable {
    let id: String
    let rocket: String
    let name: String
    let dateUtc: String
    let success: Bool?
    
    var launchDate: String {
        dateUtc.dateParsed()
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case rocket
        case name
        case dateUtc = "date_utc"
        case success
    }
    
    // MARK: - LAUNCH EXAMPLE
    static let launchExample = Launch(id: "5eb87cd9ffd86e000604b32a", rocket: "5e9d0d95eda69955f709d1eb", name: "FalconSat", dateUtc: "2006-03-24T22:30:00.000Z", success: false)
    static let launchesExample = [Launch](repeating: launchExample, count: 5)
}
