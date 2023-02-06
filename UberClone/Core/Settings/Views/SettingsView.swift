//
//  SettingsView.swift
//  UberClone
//
//  Created by Gustavo Dias on 06/02/23.
//

import SwiftUI

struct SettingsView: View {
    private let user: User
    @EnvironmentObject var viewModel: AuthViewModel
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            Color(UIColor(Color.theme.backgroundColor))
            
            VStack {
                List {
                    Section {
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
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                                .font(.title2)
                                .foregroundColor(Color.theme.primaryTextColor)
                                .padding(.vertical)
                        }
                        .padding(.vertical, 8)
                    }
                    
                    Section("Favorites") {
                        ForEach(SavedLocationViewModel.allCases) { viewModel in
                            NavigationLink {
                                Text(viewModel.title)
                            } label: {
                                SavedLocationRowView(viewModel: viewModel)
                            }

                        }
                    }
                    
                    Section("Settings") {
                        SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
                        
                        SettingsRowView(imageName: "creditcard.circle.fill", title: "Payment Methods", tintColor: Color(.systemBlue))
                    }
                    
                    Section("Account") {
                        SettingsRowView(imageName: "dollarsign.circle.fill", title: "Make Money Driving", tintColor: Color(.systemGreen))
                        
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color (.systemRed))
                            .onTapGesture {
                                viewModel.signout()
                            }
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(user: User(fullname: "Jose Ramalho Neto", email: "zeramalho@icloud.com", uid: "1234567"))
        }
    }
}

struct SavedLocationRowView: View {
    let viewModel: SavedLocationViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: viewModel.imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Text(viewModel.subtitle)
                    .font(.system(size: 14))
                    .foregroundColor (.gray)
            }
        }
    }
}

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font (.system(size: 15, weight: .semibold))
                .foregroundColor (Color.theme .primaryTextColor)
        }
    }
}
