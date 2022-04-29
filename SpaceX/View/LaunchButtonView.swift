//
//  LaunchButtonView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct LaunchButtonView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        Text("Launches".uppercased())
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
            .background(
                Color(UIColor.secondarySystemFill)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            )
            .foregroundColor(Color.green)
    }
}

//MARK: - PREVIEW
struct LaunchButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchButtonView()
    }
}
