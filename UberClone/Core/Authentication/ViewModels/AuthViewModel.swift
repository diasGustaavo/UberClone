//
//  AuthViewModel.swift
//  UberClone
//
//  Created by Gustavo Dias on 03/02/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let service = UserService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let e = error {
                print("DEBUG: Failed to sign in with error: \(e.localizedDescription)")
                return
            }
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String) {
        guard let location = LocationManager.shared.userLocation else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let e = error {
                print("DEBUG: Failed to sign up with error: \(e.localizedDescription)")
                return
            }
            
            guard let firebaseUser = result?.user else { return }
            self.userSession = firebaseUser
            
            let user = User(fullname: fullname, email: email, uid: firebaseUser.uid, coordinates: GeoPoint(latitude: location.latitude, longitude: location.longitude), accountType: .driver)
            self.currentUser = user
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            
            Firestore.firestore().collection("users").document(firebaseUser.uid).setData(encodedUser)
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
    
    // FETCH USER FUNCTION W/O COMBINE
    
//    func fetchUser() {
//        UserService().fetchUser { user in
//            self.currentUser = user
//        }
//    }
    
    func fetchUser() {
        service.$user
            .sink { user in
                self.currentUser = user
            }
            .store(in: &cancellables)
    }
}
