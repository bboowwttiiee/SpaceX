//
//  HScrollHeightView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct HScrollHeightView: View {
    //MARK: - PROPERTIES
    @AppStorage("isHeight") var isHeight: Bool = true
    var rocket: Rocket
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .frame(width: 96, height: 96, alignment: .center)
                .foregroundColor(Color(UIColor.secondarySystemFill))
            VStack(spacing: 4) {
                if isHeight {
                    Text("\(rocket.height.feet, specifier: "%.2f")")
                        .fontWeight(.semibold)
                    Text("Height, ft")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                } else {
                    Text("\(rocket.height.meters, specifier: "%.2f")")
                        .fontWeight(.semibold)
                    Text("Height, m")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                }
            } //: VSTACK
        } //: ZSTACK
    }
}

//MARK: - PREVIEW
struct HScrollHeightView_Previews: PreviewProvider {
    static var previews: some View {
        HScrollHeightView(rocket: Rocket.rocketExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
