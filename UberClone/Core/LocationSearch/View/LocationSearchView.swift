//
//  LocationSearchView.swift
//  UberClone
//
//  Created by Gustavo Dias on 31/01/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            //  header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color.theme.secondaryBackgroundColor)
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color.theme.secondaryBackgroundColor)
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // list view
            LocationSearchResultsView(viewModel: viewModel, config: .ride)
        }
        .background(Color.theme.backgroundColor)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
            .environmentObject(HomeViewModel())
    }
}
