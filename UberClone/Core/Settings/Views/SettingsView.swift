//
//  SettingsView.swift
//  UberClone
//
//  Created by Gustavo Dias on 06/02/23.
//

import SwiftUI

struct SettingsView: View {
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
                                Text("teste teste")
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text(verbatim: "email@email.com")
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
                        SavedLocationRowView(imageName: "house.circle.fill", title: "Home", subtitle: "Add Home")
                        
                        SavedLocationRowView(imageName: "archivebox.circle.fill", title: "Work", subtitle: "Add Work")
                    }
                    
                    Section("Settings") {
                        SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
                        
                        SettingsRowView(imageName: "creditcard.circle.fill", title: "Payment Methods", tintColor: Color(.systemBlue))
                    }
                    
                    Section("Account") {
                        SettingsRowView(imageName: "dollarsign.circle.fill", title: "Make Money Driving", tintColor: Color(.systemGreen))
                        
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color (.systemRed))
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
            SettingsView()
        }
    }
}

struct SavedLocationRowView: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Text(subtitle)
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
