//
//  TripAcceptedView.swift
//  UberClone
//
//  Created by Gustavo Dias on 10/02/23.
//

import SwiftUI

struct TripAcceptedView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // pickup info view
            HStack {
                Text("Meet your driver at Apple Campus for your trip to Starbucks")
                    .font(.body)
                    .frame(height: 44)
                    .lineLimit(2)
                    .padding(.trailing)
                
                Spacer()
                
                VStack {
                    Text("10")
                        .bold()
                    
                    Text("min")
                        .bold()
                }
                .frame(width: 56, height: 56)
                .foregroundColor(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
            }
            .padding()
            
            Divider()
            
            // driver info view
            HStack {
                Image("male-profile-photo")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
                
                VStack(alignment: .leading) {
                    Text("JOSE NETO")
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
                
                // driver vehicle info
                VStack(alignment: .center) {
                    Image("uber-x")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 64)
                    
                    HStack {
                        Text("Mercedes S -")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Text("5GK08")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                    .frame(width: 160)
                    .padding(.bottom)
                }
            }
            .padding()
            
            Button {
                // action
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

struct TripAcceptedView_Previews: PreviewProvider {
    static var previews: some View {
        TripAcceptedView()
    }
}
