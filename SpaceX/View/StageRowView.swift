//
//  StageRowView.swift
//  SpaceX
//
//  Created by bowtie on 13.04.2022.
//

import SwiftUI

struct StageRowView: View {
    //MARK: - PROPERTIES
    let name: String
    let content: String
    let units: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(Color(UIColor.gray))
            Spacer()
            Text(content)
            Text(units)
                .fontWeight(.semibold)
                .foregroundColor(Color(UIColor.gray))
        }
    }
}

//MARK: - PREVIEW
struct StageRowView_Previews: PreviewProvider {
    static var previews: some View {
        StageRowView(name: "Fuel amount", content: "3300", units: "ton")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
