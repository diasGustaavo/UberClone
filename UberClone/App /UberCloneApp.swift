//
//  UberCloneApp.swift
//  UberClone
//
//  Created by Gustavo Dias on 31/01/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct UberCloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
                .environmentObject(authViewModel)
                .environmentObject(homeViewModel)
        }
    }
}
