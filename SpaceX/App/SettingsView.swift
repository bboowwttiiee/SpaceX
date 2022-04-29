//
//  SettingsView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isHeight") var isHeight: Bool = false
    @AppStorage("isDiameter") var isDiameter: Bool = false
    @AppStorage("isMass") var isMass: Bool = false
    @AppStorage("isPayload") var isPayload: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                GroupBox(
                    label:
                        HStack {
                            Text("Units of measurement".uppercased()).fontWeight(.bold)
                            Spacer()
                            Image(systemName: "slider.horizontal.below.square.filled.and.square")
                        }
                ) {
                    Divider().padding(.vertical, 4)
                    
                    Text("Here you can choose in which units of measurement a particular detailed information about rockets will be displayed. Use the switches below to change the units.")
                        .padding(.vertical, 8)
                        .frame(minHeight: 60)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    //MARK: - HEIGHT TOGGLE
                    Toggle(isOn: $isHeight) {
                        if isHeight {
                            Text("Height in ".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary) +
                            Text("feet".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        } else {
                            Text("Height in meters".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    .padding()
                    .background(
                        Color(UIColor.tertiarySystemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    )
                    
                    //MARK: - DIAMETER TOGGLE
                    Toggle(isOn: $isDiameter) {
                        if isDiameter {
                            Text("Diameter in ".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary) +
                            Text("feet".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        } else {
                            Text("Diameter in meters".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    .padding()
                    .background(
                        Color(UIColor.tertiarySystemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    )
                    
                    //MARK: - MASS TOGGLE
                    Toggle(isOn: $isMass) {
                        if isMass {
                            Text("Mass in ".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary) +
                            Text("pounds".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        } else {
                            Text("Mass in kilograms".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    .padding()
                    .background(
                        Color(UIColor.tertiarySystemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    )
                    
                    //MARK: - PAYLOAD TOGGLE
                    Toggle(isOn: $isPayload) {
                        if isPayload {
                            Text("Payload in ".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary) +
                            Text("pounds".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        } else {
                            Text("Payload in kilograms".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    .padding()
                    .background(
                        Color(UIColor.tertiarySystemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    )
                } //: BOX
                Spacer()
            } //: VSTACK
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
            .padding()
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
