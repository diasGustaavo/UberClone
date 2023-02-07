//
//  DeveloperPreview.swift
//  UberClone
//
//  Created by Gustavo Dias on 07/02/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let mockUser = User(fullname: "Jose Ramalho Neto", email: "zeramalho@icloud.com", uid: NSUUID().uuidString, coordinates: GeoPoint(latitude: 37.38, longitude: -122.05), accountType: .passenger, homeLocation: nil, workLocation: nil)
}
