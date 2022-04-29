//
//  HScrollMassView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct HScrollMassView: View {
    //MARK: - PROPERTIES
    @AppStorage("isMass") var isMass: Bool = false
    var rocket: Rocket
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .frame(width: 96, height: 96, alignment: .center)
                .foregroundColor(Color(UIColor.secondarySystemFill))
            VStack(spacing: 4) {
                if isMass {
                    Text("\(rocket.mass.lb)")
                        .fontWeight(.semibold)
                    Text("Mass, lb")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                } else {
                    Text("\(rocket.mass.kg)")
                        .fontWeight(.semibold)
                    Text("Mass, kg")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                }
            } //: VSTACK
        } //: ZSTACK
    }
}

//MARK: - PREVIEW
struct HScrollMassView_Previews: PreviewProvider {
    static var previews: some View {
        HScrollMassView(rocket: Rocket.rocketExample)
    }
}
