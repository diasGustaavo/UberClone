//
//  AcceptTripView.swift
//  UberClone
//
//  Created by Gustavo Dias on 08/02/23.
//

import SwiftUI
import MapKit

struct AcceptTripView: View {
    @State private var region: MKCoordinateRegion
    let trip: Trip
    let annotationItem: UberLocation
    @EnvironmentObject var viewModel: HomeViewModel
    
    init(trip: Trip) {
        let center = CLLocationCoordinate2D(latitude: trip.pickupLocation.latitude, longitude: trip.pickupLocation.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        
        self.region = MKCoordinateRegion(center: center, span: span)
        
        self.trip = trip
        self.annotationItem = UberLocation(title: trip.pickupLocationName, coordinate: trip.pickupLocation.toCoordinate())
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // Header
            HStack {
                Text("Would you like to pickup \nthis passenger?")
                    .lineLimit(2)
                    .font(.headline)
                    .fontWeight(.semibold)
                
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
                    Text(trip.passengerName)
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
                    
                    Text(trip.tripCost.toCurrency())
                        .font(.title2)
                        .bold()
                }
            }
            .padding(.vertical)
            
            Divider()
            
            // Destination Info
            Group {
                HStack {
                    Text(trip.pickupLocationName)
                        .lineLimit(1)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(trip.distanceToPassenger?.distanceInKmString() ?? "")
                        .lineLimit(1)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding(.top)
                
                HStack {
                    Text(trip.pickupLocationAddress)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("km")
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            // map
            Map(coordinateRegion: $region, annotationItems: [annotationItem]) { item in
                MapMarker(coordinate: item.coordinate)
            }
            .frame(height: 220)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.6), radius: 10)
            .padding(.vertical)
            
            HStack {
                Button {
                    viewModel.rejectTrip()
                } label: {
                    Text("Reject")
                        .bold()
                        .frame(width: UIScreen.main.bounds.width * 0.43, height: 56)
                        .foregroundColor(.white)
                        .background(Color(.systemRed))
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button {
                    viewModel.acceptTrip()
                } label: {
                    Text("Accept")
                        .bold()
                        .frame(width: UIScreen.main.bounds.width * 0.43, height: 56)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }

            }
            
        }
        .padding(.horizontal)
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(30)
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

struct AcceptTripView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptTripView(trip: dev.mockTrip)
    }
}
