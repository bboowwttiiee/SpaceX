//
//  HScrollDiameterView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct HScrollDiameterView: View {
    //MARK: - PROPERTIES
    @AppStorage("isDiameter") var isDiameter: Bool = false
    var rocket: Rocket
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .frame(width: 96, height: 96, alignment: .center)
                .foregroundColor(Color(UIColor.secondarySystemFill))
            VStack(spacing: 4) {
                if isDiameter {
                    Text("\(rocket.diameter.feet, specifier: "%.2f")")
                        .fontWeight(.semibold)
                    Text("Diameter, ft")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                } else {
                    Text("\(rocket.diameter.meters, specifier: "%.2f")")
                        .fontWeight(.semibold)
                    Text("Diameter, m")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                }
            } //: VSTACK
        } //: ZSTACK
    }
}

//MARK: - PREVIEW
struct HScrollDiameterView_Previews: PreviewProvider {
    static var previews: some View {
        HScrollDiameterView(rocket: Rocket.rocketExample)
    }
}
