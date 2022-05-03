//
//  Api.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

class SpaceXModel: ObservableObject {
    //MARK: - PROPERTIES
    @Published var rockets = [Rocket]()
    @Published var launches = [Launch]()
    @Published var loadingRockets = false
    @Published var loadingLaunches = false
    
    //MARK: - INIT
    init() {
        getRockets()
        getLaunches()
    }
    
    //MARK: - ROCKETS PARSER
    func getRockets() {
        self.loadingRockets = true
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                do {
                    self.rockets = try JSONDecoder().decode([Rocket].self, from: data)
                    self.loadingRockets = false
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    //MARK: - LAUNCHES PARSER
    func getLaunches() {
        self.loadingLaunches = true
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                do {
                    self.launches = try JSONDecoder().decode([Launch].self, from: data)
                    self.loadingLaunches = false
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func launchesFor(_ rocket: Rocket) -> [Launch] {
        return launches.filter { $0.rocket == rocket.id }
    }
}
