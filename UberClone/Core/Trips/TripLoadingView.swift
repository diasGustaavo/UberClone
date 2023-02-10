//
//  TripLoadingView.swift
//  UberClone
//
//  Created by Gustavo Dias on 10/02/23.
//

import SwiftUI

struct TripLoadingView: View {
    var body: some View {
        VStack {
            Text("Finding you a ride...")
                .padding()
        }
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

struct TripLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        TripLoadingView()
    }
}
