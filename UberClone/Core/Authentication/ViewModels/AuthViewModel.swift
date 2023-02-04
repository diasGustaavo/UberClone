//
//  AuthViewModel.swift
//  UberClone
//
//  Created by Gustavo Dias on 03/02/23.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let e = error {
                print("DEBUG: Failed to sign in with error: \(e.localizedDescription)")
                return
            }
            
            print("DEBUG: Signed user in sucessfully")
            print("DEBUGF: User id \(result?.user.uid)")
            self.userSession = result?.user
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let e = error {
                print("DEBUG: Failed to sign up with error: \(e.localizedDescription)")
                return
            }
            
            print("DEBUG: Registered user sucessfully")
            print("DEBUGF: User id \(result?.user.uid)")
            self.userSession = result?.user
        }
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: Did sign out with firebase")
            self.userSession = nil
        } catch {
            print("DEBUG: Failed to sign out with error: \(error.localizedDescription)")
        }
    }
}
