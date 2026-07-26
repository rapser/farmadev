//
//  GoogleMapView.swift
//  farmedev
//
//  Thin UIViewRepresentable wrapper around GMSMapView. The address picker uses a fixed
//  center pin overlay (SwiftUI) rather than a draggable GMSMarker, so dragging the map
//  is what moves the "selected" coordinate — the standard center-pin UX pattern.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var initialZoom: Float = 16

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: centerCoordinate.latitude, longitude: centerCoordinate.longitude, zoom: initialZoom)
        let options = GMSMapViewOptions()
        options.camera = camera
        let mapView = GMSMapView(options: options)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        guard !context.coordinator.isUserInteracting else { return }
        let current = mapView.camera.target
        if abs(current.latitude - centerCoordinate.latitude) > 0.0001 || abs(current.longitude - centerCoordinate.longitude) > 0.0001 {
            mapView.animate(toLocation: centerCoordinate)
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject, GMSMapViewDelegate {
        private let parent: GoogleMapView
        var isUserInteracting = false

        init(_ parent: GoogleMapView) {
            self.parent = parent
        }

        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            isUserInteracting = gesture
        }

        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            isUserInteracting = false
            parent.centerCoordinate = position.target
        }
    }
}
