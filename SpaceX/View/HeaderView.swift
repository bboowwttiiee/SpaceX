//
//  HeaderView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    var rocket: Rocket
    
    //MARK: - BODY
    var body: some View {
        AsyncImage(url: URL(string: rocket.flickrImages[0])) { image in
            image
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(height: 185, alignment: .top)
        } placeholder: {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .frame(height: 185, alignment: .top)
        }
    }
}

//MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(rocket: Rocket.rocketExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
