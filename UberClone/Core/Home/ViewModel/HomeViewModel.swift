//
//  HomeViewModel.swift
//  UberClone
//
//  Created by Gustavo Dias on 07/02/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var drivers = [User]()
    private let service = UserService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchUser()
    }
    
    func fetchDrivers() {
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let drivers = documents.compactMap({ try? $0.data(as: User.self) })
                self.drivers = drivers
            }
    }
    
    // FETCH USER FUNCTION W/O COMBINE
    
//    func fetchUser() {
//        UserService().fetchUser { user in
//            guard user.accountType == .passenger else { return }
//            self.currentUser = user
//        }
//    }
    
    func fetchUser() {
        service.$user
            .sink { user in
                guard let user = user else { return }
                guard user.accountType == .passenger else { return }
                self.fetchDrivers()
            }
            .store(in: &cancellables)
    }
}
