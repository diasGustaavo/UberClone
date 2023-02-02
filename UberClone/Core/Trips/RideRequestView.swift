//
//  RideRequestView.swift
//  UberClone
//
//  Created by Gustavo Dias on 01/01/23.
//

import SwiftUI

struct RideRequestView: View {
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @State private var selectedRideType: RideType = .uberX
    
    var body: some View {
        VStack(alignment: .center) {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
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
                        Text("Current Location")
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
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text("$22.04")
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding(8)
                        }
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectedRideType ? 1.05 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
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
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(16)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
            .environmentObject(LocationSearchViewModel())
    }
}
