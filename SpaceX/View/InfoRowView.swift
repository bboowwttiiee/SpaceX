//
//  InfoRowView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct InfoRowView: View {
    //MARK: - PROPERTIES
    let name: String
    let content: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(Color(UIColor.gray))
            Spacer()
            Text(content)
        }
    }
}

//MARK: - PREVIEW
struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(name: "First flight", content: "March 24, 2006")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
