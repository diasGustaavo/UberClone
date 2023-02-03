//
//  RegistrationView.swift
//  UberClone
//
//  Created by Gustavo Dias on 02/02/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    
    var body: some View {
        ZStack {
            Color(UIColor(Color.theme.backgroundColor))
            
            VStack(alignment: .leading) {
                
                // Back Button
                Button {
                    // go back
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .imageScale(.medium)
                        .padding(.all)
                        .foregroundColor(Color.theme.primaryTextColor)
                }
                
                Text("Create new account")
                    .font(.system(size: 40, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .padding(.all)
                    .frame(width: 250)
                
                Spacer()
                
                // Fields
                Group {
                    // Name Field
                    VStack {
                        Text("Full Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .semibold))
                        
                        TextField("Enter your full name", text: $email)
                            .frame(height: 32)
                            .background(Color.theme.backgroundColor)
                            .padding(.trailing)
                    }
                    .padding(.vertical)
                    
                    // Email Field
                    VStack {
                        Text("Email Address")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .semibold))
                        
                        TextField("name@example.com", text: $email)
                            .frame(height: 32)
                            .background(Color.theme.backgroundColor)
                            .padding(.trailing)
                    }
                    .padding(.vertical)
                    
                    // Password Field
                    VStack {
                        Text("Create Password")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .semibold))
                        
                        TextField("Enter your password", text: $email)
                            .frame(height: 32)
                            .background(Color.theme.backgroundColor)
                            .padding(.trailing)
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Sign Up Button
                Button {
                    // sign up
                } label: {
                    HStack {
                        Spacer()
                        Text("Sign Up")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.theme.backgroundColor)
                            .padding(.all)
                        Spacer()
                    }
                    .background(Color.theme.primaryTextColor)
                    .cornerRadius(10)
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
