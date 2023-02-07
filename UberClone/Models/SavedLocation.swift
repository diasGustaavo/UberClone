//
//  SavedLocation.swift
//  UberClone
//
//  Created by Gustavo Dias on 07/02/23.
//

import Firebase

struct SavedLocation: Codable {
    let title: String
    let address: String
    let coordinates: GeoPoint
}
