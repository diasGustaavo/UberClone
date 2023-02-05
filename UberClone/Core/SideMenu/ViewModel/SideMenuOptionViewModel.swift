//
//  SideMenuOptionViewModel.swift
//  UberClone
//
//  Created by Gustavo Dias on 04/02/23.
//

import Foundation

enum SideMenuOptionViewModel: Int, CaseIterable {
    case trips
    case wallet
    case settings
    case messages
    
    var title: String {
        switch self {
        case .trips: return "Your Trips"
        case .wallet: return "Wallet"
        case .settings: return "Settings"
        case .messages: return "Messages"
        }
    }
    
    var imageName: String {
        switch self {
        case .trips: return "list.bullet.rectangle"
        case .wallet: return "creditcard"
        case .settings: return "gear"
        case .messages: return "bubble.left"
        }
    }
}
