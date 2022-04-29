//
//  Api.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

class Api {
    // MARK: - ROCKET API
    func getRockets(completion: @escaping ([Rocket]) -> ()) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let rockets = try JSONDecoder().decode([Rocket].self, from: data!)
                DispatchQueue.main.async {
                    completion(rockets)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    // MARK: - LAUNCH API
    func getLaunches(completion: @escaping ([Launch]) -> ()) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let launches = try JSONDecoder().decode([Launch].self, from: data!)
                DispatchQueue.main.async {
                    completion(launches)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
