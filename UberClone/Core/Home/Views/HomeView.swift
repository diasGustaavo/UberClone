//
//  HomeView.swift
//  UberClone
//
//  Created by Gustavo Dias on 31/01/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearchView = false
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if !showLocationSearchView {
                LocationSearchActivationView()
                    .padding(.vertical, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearchView.toggle()
                        }
                    }
            } else {
                LocationSearchView()
            }
            
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
