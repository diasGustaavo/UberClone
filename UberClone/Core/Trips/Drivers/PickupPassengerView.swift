//
//  PickupPassengerView.swift
//  UberClone
//
//  Created by Gustavo Dias on 13/02/23.
//

import SwiftUI

struct PickupPassengerView: View {
    let trip: Trip
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // Header
            HStack {
                Text("Pickup \(trip.passengerName) at \(trip.dropoffLocationName)")
                    .lineLimit(2)
                    .font(.headline)
                
                Spacer()
                
                VStack {
                    Text("\(trip.travelTimeToPassenger ?? 0)")
                        .bold()
                    
                    Text("min")
                        .bold()
                }
                .frame(width: 56, height: 56)
                .foregroundColor(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
            }
            .padding(.vertical)
            
            Divider()
            
            // Passenger & Earnings info
            HStack {
                Image("male-profile-photo")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
                
                VStack(alignment: .leading) {
                    Text("\(trip.passengerName)")
                        .bold()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(.systemYellow))
                            .imageScale(.small)
                        
                        Text("4.8")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Earnings")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("\(trip.tripCost.toCurrency())")
                        .font(.title2)
                        .bold()
                }
            }
            
            Divider()
            
            Button {
                viewModel.cancelTripAsDriver()
            } label: {
                ZStack {
                    Rectangle()
                        .cornerRadius(8)
                        .foregroundColor(Color.red)
                        .frame(height: 57)
                    
                    Text("CANCEL TRIP")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .bold))
                }
            }
            .frame(alignment: .center)
        }
        .padding(.horizontal)
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

struct PickupPassengerView_Previews: PreviewProvider {
    static var previews: some View {
        PickupPassengerView(trip: dev.mockTrip)
    }
}
