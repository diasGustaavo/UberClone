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
    
    func registerUser(withEmail email: String, password: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let e = error {
                print("DEBUG: Failed to sign up with error: \(e.localizedDescription)")
                return
            }
            
            print("DEBUG: Registered user sucessfully")
            print("DEBUGF: User id \(result?.user.uid)")
        }
    }
}
