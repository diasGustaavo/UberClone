//
//  MapViewActionButton.swift
//  UberClone
//
//  Created by Gustavo Dias on 31/01/23.
//

import SwiftUI

struct MapViewActionButton: View {
    var body: some View {
        Button {
            // test
        } label: {
            Image(systemName: "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton()
    }
}
