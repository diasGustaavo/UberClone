//
//  SideMenuView.swift
//  UberClone
//
//  Created by Gustavo Dias on 04/02/23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        ZStack {
            Color(UIColor(Color.theme.backgroundColor))
            
            HStack {
                VStack(alignment: .leading) {
                    // user info
                    HStack {
                        Image("male-profile-photo")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading) {
                            Text("Jose Ramalho Neto")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text(verbatim: "joseramalho@icloud.com")
                                .font(.system(size: 14))
                                .foregroundColor(Color.theme.primaryTextColor)
                                .opacity(0.77)
                        }
                    }
                    .padding(.vertical, 35)
                    
                    // be a driver offering
                    Group {
                        Text("Do more with your account")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Button {
                            // action
                        } label: {
                            Image(systemName: "dollarsign.square")
                                .font(.title2)
                                .imageScale(.medium)
                            Text("Make Money Driving")
                                .font(.system(size: 16, weight: .semibold))
                                .padding (6)
                        }
                        .foregroundColor(Color.theme.primaryTextColor)
                    }
                    
                    
                    Divider()
                        .padding(.vertical)
                    
                    ForEach(SideMenuOptionViewModel.allCases, id: \.self) { viewModel in
                        SideMenuButton(sideMenuOptionViewModel: viewModel)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

struct SideMenuButton: View {
    let sideMenuOptionViewModel: SideMenuOptionViewModel
    
    var body: some View {
        Button {
            // action
        } label: {
            Image(systemName: sideMenuOptionViewModel.imageName)
                .font (.title2)
                .imageScale(.medium)
            Text(sideMenuOptionViewModel.title)
                .font(.system(size: 16, weight: .semibold))
                .padding (6)
        }
        .foregroundColor(Color.theme.primaryTextColor)
        .padding(.vertical)
    }
}
