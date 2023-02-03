//
//  UberCloneApp.swift
//  UberClone
//
//  Created by Gustavo Dias on 31/01/23.
//

import SwiftUI

@main
struct UberCloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            RegistrationView()
                .environmentObject(locationViewModel)
        }
    }
}
