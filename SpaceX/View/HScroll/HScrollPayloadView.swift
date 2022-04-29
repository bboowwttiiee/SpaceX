//
//  HScrollPayloadView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct HScrollPayloadView: View {
    //MARK: - PROPERTIES
    @AppStorage("isPayload") var isPayload: Bool = false
    var rocket: Rocket
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .frame(width: 96, height: 96, alignment: .center)
                .foregroundColor(Color(UIColor.secondarySystemFill))
            VStack(spacing: 4) {
                if isPayload {
                    if let payloadLeo = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
                        Text("\(payloadLeo.lb)")
                            .fontWeight(.semibold)
                    }
                    Text("Payload, lb")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                } else {
                    if let payloadLeo = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
                        Text("\(payloadLeo.kg)")
                            .fontWeight(.semibold)
                    }
                    Text("Payload, kg")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.gray))
                }
            } //: VSTACK
        } //: ZSTACK
    }
}

//MARK: - PREVIEW
struct HScrollPayloadView_Previews: PreviewProvider {
    static var previews: some View {
        HScrollPayloadView(rocket: Rocket.rocketExample)
    }
}
