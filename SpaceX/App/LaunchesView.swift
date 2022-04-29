//
//  LaunchesView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct LaunchesView: View {
    //MARK: - PROPERTIES
    var launches: [Launch]
    var rocket: Rocket
    
    //MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(launches.filter{ $0.rocket == rocket.id }) { launch in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(launch.name)
                                .font(.title3)
                            Text(launch.launchDate)
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.gray))
                        }
                        Spacer()
                        if let success = launch.success {
                            Image(success ? "isSuccessful" : "isNotSuccessful")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42, alignment: .center)
                        }
                    } //: HSTACK
                    .padding(24)
                    .background(
                        Color(UIColor.secondarySystemFill)
                            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    )
                } //: LOOP
            } //: VSTACK
            .padding(.horizontal, 32)
        } //: SCROLL
        .navigationBarTitle(rocket.name)
    }
}

//MARK: - PREVIEW
struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesView(launches: Launch.launchesExample, rocket: Rocket.rocketExample)
    }
}
