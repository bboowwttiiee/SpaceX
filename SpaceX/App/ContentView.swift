//
//  ContentView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var isShowingSettings: Bool = false
    @State private var rockets: [Rocket] = []
    @State private var launches: [Launch] = []
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            if rockets.isEmpty {
                ProgressView("Loading data...")
            } else {
                TabView {
                    ForEach(rockets.shuffled()) { rocket in
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                //MARK: - HEADER
                                HeaderView(rocket: rocket)
                                
                                ZStack(alignment: .top) {
                                    RoundedRectangle(cornerRadius: 32)
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 865, maxHeight: .infinity, alignment: .center)
                                        .foregroundColor(Color(UIColor.systemBackground))
                                    
                                    VStack {
                                        HStack {
                                            Text(rocket.name)
                                                .font(.title)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Button(action: {
                                                isShowingSettings = true
                                            }) {
                                                Image(systemName: "gearshape")
                                                    .resizable()
                                                    .scaledToFit()
                                            }
                                            .sheet(isPresented: $isShowingSettings) {
                                                SettingsView()
                                            }
                                        } //: HSTACK
                                        .frame(height: 28)
                                        .padding(.top, 48)
                                        .padding(.horizontal, 32)
                                        
                                        //MARK: - HORIZONTAL SCROLL
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                HScrollHeightView(rocket: rocket)
                                                HScrollDiameterView(rocket: rocket)
                                                HScrollMassView(rocket: rocket)
                                                HScrollPayloadView(rocket: rocket)
                                            }
                                            .padding(.horizontal, 32)
                                        } //: SCROLL
                                        .padding(.vertical, 32)
                                        
                                        //MARK: - INFO
                                        VStack(spacing: 16) {
                                            InfoRowView(name: "First flight", content: rocket.firstFlightDate)
                                            InfoRowView(name: "Country", content: rocket.country)
                                            InfoRowView(name: "Cost per launch", content: "$\(rocket.costPerLaunch / 1000000)M")
                                        } //: VSTACK
                                        .padding(.horizontal, 32)
                                        
                                        //MARK: - 1ST STAGE
                                        VStack(spacing: 16) {
                                            HStack {
                                                Text("First stage".uppercased())
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                Spacer()
                                            }
                                            InfoRowView(name: "Engines", content: "\(rocket.firstStage.engines)")
                                            StageRowView(name: "Fuel amount", content: "\(rocket.firstStage.fuelAmountTons)", units: "ton")
                                            StageRowView(name: "Burning time", content: rocket.firstStage.burnTimeSec != nil ? "\(rocket.firstStage.burnTimeSec!)" : "N/A", units: "sec")
                                        } //: VSTACK
                                        .padding(.horizontal, 32)
                                        .padding(.top, 32)
                                        
                                        //MARK: - 2ND STAGE
                                        VStack(spacing: 16) {
                                            HStack {
                                                Text("Second stage".uppercased())
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                Spacer()
                                            }
                                            InfoRowView(name: "Engines", content: "\(rocket.secondStage.engines)")
                                            StageRowView(name: "Fuel amount", content: "\(rocket.secondStage.fuelAmountTons)", units: "ton")
                                            StageRowView(name: "Burning time", content: rocket.secondStage.burnTimeSec != nil ? "\(rocket.secondStage.burnTimeSec!)" : "N/A", units: "sec")
                                        } //: VSTACK
                                        .padding(.horizontal, 32)
                                        .padding(.top, 32)
                                        
                                        //MARK: - LAUNCHES BUTTON
                                        NavigationLink {
                                            let rocketLaunches = launches.filter{ $0.rocket == rocket.id }
                                            LaunchesView(launches: rocketLaunches, rocket: rocket)
                                        } label: {
                                            LaunchButtonView()
                                                .padding(32)
                                        }
                                    } //: VSTACK
                                } //: ZSTACK
                            } //: VSTACK
                        } //: SCROLL
                    } //: LOOP
                } //: TAB
                .tabViewStyle(.page)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.vertical)
            }
        } //: NAVIGATION
        .onAppear {
            Api().getRockets { rockets in
                self.rockets = rockets
                Api().getLaunches { launches in
                    for rocket in rockets {
                        self.launches.append(contentsOf: launches.filter{ $0.rocket == rocket.id })
                    }
                }
            }
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
