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
}
