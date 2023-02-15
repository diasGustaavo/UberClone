//
//  TripCancelledView.swift
//  UberClone
//
//  Created by Gustavo Dias on 15/02/23.
//

import SwiftUI

struct TripCancelledView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            Text(viewModel.tripCancelledMessage)
                .font(.headline)
                .padding(.vertical)
            
            Button {
                print("DEBUG: CANCEL BUTTON PRESSED!")
                guard let user = viewModel.currentUser else { return }
                guard let trip = viewModel.trip else { return }
                print("DEBUG: TRIPSTATE = \(trip.state)")
                
                if user.accountType == .passenger {
                    if trip.state == .driverCancelled {
                        viewModel.deleteTrip()
                    } else if trip.state == .passengerCancelled {
                        viewModel.trip = nil
                    }
                } else {
                    if trip.state == .passengerCancelled {
                        viewModel.deleteTrip()
                    } else if trip.state == .driverCancelled {
                        viewModel.trip = nil
                    }
                }
            } label: {
                ZStack {
                    Rectangle()
                        .cornerRadius(8)
                        .foregroundColor(Color.blue)
                        .frame(height: 57)
                    
                    Text("OK")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .bold))
                }
            }
            .frame(alignment: .center)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

struct TripCancelledView_Previews: PreviewProvider {
    static var previews: some View {
        TripCancelledView()
    }
}
