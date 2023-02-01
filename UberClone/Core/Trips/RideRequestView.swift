//
//  RideRequestView.swift
//  UberClone
//
//  Created by Gustavo Dias on 01/01/23.
//

import SwiftUI

struct RideRequestView: View {
    @State private var startLocationText: String?
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
            //  header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 28)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 8, height: 8)
                }
                
                VStack(alignment: .leading, spacing: 28) {
                    HStack {
                        Text(startLocationText ?? "Current Location")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("02:45 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color.gray)
                    }
                    
                    HStack {
                        Text(viewModel.queryFragment == "" ? "Destination" : viewModel.queryFragment)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Text("02:59 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color.gray)
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // RIDE TYPES
            ScrollView(.horizontal) {
                HStack (spacing: 12) {
                    ForEach(0 ..< 3, id: \.self) { _ in
                        VStack(alignment: .leading) {
                            Image("uber-x")
                                .resizable()
                                .scaledToFit()
                            
                            VStack(spacing: 4) {
                                Text("Uber-X")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(Color.gray)
                                
                                Text("$22.04")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(8)
                        }
                        .frame(width: 112, height: 140)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            
            // SELECTED PAYMENT
            HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.blue)
                            .frame(width: 50, height: 30)
                            .cornerRadius(5)
                        
                        Text("Visa")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading)
                    
                    Text("**** 1234")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(.medium)
                        .padding()
                }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 6)
            
            Button {
                // action
            } label: {
                ZStack {
                    Rectangle()
                        .cornerRadius(8)
                        .foregroundColor(Color.blue)
                        .frame(height: 57)
                        .padding(.horizontal)
                    
                    Text("CONFIRM RIDE")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .bold))
                }
            }
            .frame(alignment: .center)
        }
        .background(.white)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView(mapState: .constant(.searchingForLocation))
            .environmentObject(LocationSearchViewModel())
    }
}
