//
//  TripLoadingView.swift
//  UberClone
//
//  Created by Gustavo Dias on 10/02/23.
//

import SwiftUI

struct TripLoadingView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            HStack {
                
                if let trip = viewModel.trip {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Connecting you to a driver")
                            .font(.headline)
                        
                        Text("With destination to \(trip.dropoffLocationName)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .padding()
                }
                
                Spacer()
                
                Spinner(lineWidth: 6, height: 64, width: 64)
                    .padding()
            }
            .padding(.bottom, 24)
            
            Button {
                viewModel.cancelledTripAsPassenger()
            } label: {
                ZStack {
                    Rectangle()
                        .cornerRadius(8)
                        .foregroundColor(Color.red)
                        .frame(height: 57)
                        .padding(.horizontal)
                    
                    Text("CANCEL RIDE")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .bold))
                }
            }
            .frame(alignment: .center)
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

struct TripLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        TripLoadingView()
            .environmentObject(DeveloperPreview.shared.mockHomeView)
    }
}
