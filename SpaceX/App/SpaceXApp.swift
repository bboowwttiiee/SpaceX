//
//  SpaceXApp.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

@main
struct SpaceXApp: App {
    @StateObject var spacex = SpaceXModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(spacex)
        }
    }
}
