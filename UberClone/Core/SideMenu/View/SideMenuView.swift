//
//  SideMenuView.swift
//  UberClone
//
//  Created by Gustavo Dias on 04/02/23.
//

import SwiftUI

struct SideMenuView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
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
                            Text(user.fullname)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text(verbatim: user.email)
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
                                .padding(6)
                        }
                        .foregroundColor(Color.theme.primaryTextColor)
                    }
                    
                    
                    Divider()
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        ForEach(SideMenuOptionViewModel.allCases) { viewModel in
                            NavigationLink(value: viewModel) {
                                SideMenuButton(sideMenuOptionViewModel: viewModel)
                            }
                        }
                    }
                    .navigationDestination(for: SideMenuOptionViewModel.self) { viewModel in
                        switch viewModel {
                        case .trips:
                            Text("Trips")
                        case .wallet:
                            Text("Wallet")
                        case .settings:
                            SettingsView()
                        case .messages:
                            Text("Messages")
                        }
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
        NavigationStack {
            SideMenuView(user: User(fullname: "Jose Ramalho Neto", email: "zeramalho@icloud.com", uid: "1234567"))
        }
    }
}

struct SideMenuButton: View {
    let sideMenuOptionViewModel: SideMenuOptionViewModel
    
    var body: some View {
        HStack {
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
