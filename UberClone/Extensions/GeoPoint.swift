//
//  GeoPoint.swift
//  UberClone
//
//  Created by Gustavo Dias on 09/02/23.
//

import Firebase
import CoreLocation

extension GeoPoint {
    func toCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
