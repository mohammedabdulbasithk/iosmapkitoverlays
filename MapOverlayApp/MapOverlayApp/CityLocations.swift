//
//  CityLocations.swift
//  MapOverlayApp
//
//  Created by Basith on 14/10/19.
//  Copyright © 2019 TechPro. All rights reserved.
//

import UIKit
import MapKit

class CityLocation: NSObject,MKAnnotation {
    var identifier = "city location"
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init(name:String,lat:CLLocationDegrees,long:CLLocationDegrees) {
        title = name
        coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}
class CityLocations: NSObject {
    var hospital = [CityLocation]()
    override init() {
        hospital += [CityLocation(name: "Amritha", lat: 10.0355, long: 76.2919)]
        hospital += [CityLocation(name: "Aster", lat: 10.0455, long: 76.2319)]
        hospital += [CityLocation(name: "Rajagiry", lat: 10.0876, long: 76.3886)]
    }
}
