//
//  UberLocation.swift
//  UberClone
//
//  Created by Gustavo Dias on 02/02/23.
//

import CoreLocation

struct UberLocation: Identifiable {
    let id = NSUUID().uuidString
    
    let title: String
    let coordinate: CLLocationCoordinate2D
}
