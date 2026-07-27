//
//  LocationProvider.swift
//  farmedev
//

import CoreLocation

@Observable
final class LocationProvider: NSObject, CLLocationManagerDelegate {
    var currentLocation: CLLocationCoordinate2D?

    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        currentLocation = coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Fall back silently — AddressPickerView keeps its default Lima-centered coordinate.
    }
}
