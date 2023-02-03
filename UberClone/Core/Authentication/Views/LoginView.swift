//
//  LoginView.swift
//  UberClone
//
//  Created by Gustavo Dias on 02/02/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(UIColor(Color.theme.backgroundColor))
                
                VStack {
                    // Header
                    Group {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.theme.primaryTextColor)
                                .frame(height: geo.size.height * 0.2)
                            
                            Rectangle()
                                .foregroundColor(Color.theme.backgroundColor)
                                .frame(width: geo.size.height * 0.06, height: geo.size.height * 0.06)
                                .cornerRadius(7)
                            
                            Rectangle()
                                .foregroundColor(Color.theme.backgroundColor)
                                .frame(width: geo.size.height * 0.25, height: geo.size.height * 0.02)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Text("UBER")
                            .font(.system(size: 45))
                    }
                    
                    
                    Spacer()
                    // Login Field
                    Group {
                        Text("Email Address")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .semibold))
                        
                        TextField("name@example.com", text: $email)
                            .frame(height: 32)
                            .background(Color.theme.backgroundColor)
                            .padding(.trailing)
                    }
                    
                    // Password Field
                    Group {
                        Text("Password")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .semibold))
                        
                        TextField("Enter your password", text: $email)
                            .frame(height: 32)
                            .background(Color.theme.backgroundColor)
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Text("Forgot Password?")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.system(size: 14, weight: .bold))
                    }
                    
                    // Sign in with social
                    Group {
                        Spacer()
                        
                        HStack {
                            line
                            Text("Or")
                                .font(.system(size: 13, weight: .semibold))
                                .lineLimit(1)
                            line
                        }
                        
                        Spacer()
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: geo.size.height * 0.07, height: geo.size.height * 0.07)
                                    .foregroundColor(Color.blue)
                                
                                Image("facebook")
                                    .resizable()
                                    .frame(width: geo.size.height * 0.03, height: geo.size.height * 0.03)
                                    .grayscale(0.99)
                            }
                            
                            ZStack {
                                Circle()
                                    .frame(width: geo.size.height * 0.07, height: geo.size.height * 0.07)
                                    .foregroundColor(Color.red)
                                
                                Image("google")
                                    .resizable()
                                    .frame(width: geo.size.height * 0.03, height: geo.size.height * 0.03)
                                    .grayscale(0.99)
                            }
                        }
                        
                        Spacer()
                    }
                    
                    // SIGN IN / UP BUTTONS
                    
                    Group {
                        Button {
                            // action
                        } label: {
                            HStack {
                                Spacer()
                                Text("SIGN IN")
                                Image(systemName: "arrow.right")
                                Spacer()
                            }
                            .padding(.all)
                            .foregroundColor(Color.theme.backgroundColor)
                            .background(Color.theme.primaryTextColor)
                            .cornerRadius(10)
                        }
                        
                        Spacer()
                        
                        Button {
                            // action
                        } label: {
                            HStack {
                                Text("Don't have an account?")
                                Text("Sign Up")
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(Color.theme.primaryTextColor)
                        }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.theme.primaryTextColor) }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
