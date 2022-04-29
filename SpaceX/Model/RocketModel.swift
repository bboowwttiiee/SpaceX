//
//  RocketModel.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

// MARK: - ROCKET MODEL
struct Rocket: Codable, Identifiable {
    let id: String
    let flickrImages: [String]
    let name: String
    let height: HeightDiameter
    let diameter: HeightDiameter
    let mass: Mass
    let payloadWeights: [Payload]
    let firstFlight: String
    let country: String
    let costPerLaunch: Int
    let firstStage: Stage
    let secondStage: Stage
    
    var firstFlightDate: String {
        firstFlight.dateParsed()
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case flickrImages = "flickr_images"
        case name
        case height
        case diameter
        case mass
        case payloadWeights = "payload_weights"
        case firstFlight = "first_flight"
        case country
        case costPerLaunch = "cost_per_launch"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
    }
    
    // MARK: - ROCKET EXAMPLE
    static let rocketExample = Rocket(id: "5e9d0d95eda69955f709d1eb", flickrImages: ["https://imgur.com/DaCfMsj.jpg", "https://imgur.com/azYafd8.jpg"], name: "Falcon 1", height: HeightDiameter.heightExample, diameter: HeightDiameter.diameterExample, mass: Mass.massExample, payloadWeights: Payload.payloadsExample, firstFlight: "2006-03-24", country: "Republic of the Marshall Islands", costPerLaunch: 6700000, firstStage: Stage.stageExample, secondStage: Stage.stageExample)
    
    // MARK: - HEIGHT/DIAMETER
    struct HeightDiameter: Codable {
        let meters: Double
        let feet: Double
        
        static let heightExample = HeightDiameter(meters: 22.25, feet: 73)
        static let diameterExample = HeightDiameter(meters: 1.68, feet: 5.5)
    }
    
    // MARK: - MASS
    struct Mass: Codable {
        let kg: Int
        let lb: Int
        
        static let massExample = Mass(kg: 30146, lb: 66460)
    }
    
    // MARK: - PAYLOAD
    struct Payload: Codable {
        let id: String
        let kg: Int
        let lb: Int
        
        static let payloadExample = Payload(id: "leo", kg: 450, lb: 992)
        static let payloadsExample = [Payload](repeating: payloadExample, count: 5)
    }
    
    // MARK: - STAGE
    struct Stage: Codable {
        let engines: Int
        let fuelAmountTons: Double
        let burnTimeSec: Int?
        
        enum CodingKeys: String, CodingKey {
            case engines
            case fuelAmountTons = "fuel_amount_tons"
            case burnTimeSec = "burn_time_sec"
        }
        
        static let stageExample = Stage(engines: 1, fuelAmountTons: 44.3, burnTimeSec: 169)
    }
}
