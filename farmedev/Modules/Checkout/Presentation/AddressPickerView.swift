//
//  AddressPickerView.swift
//  farmedev
//
//  Map-based address entry: drag the map, the fixed center pin marks the delivery point;
//  reverse geocoding (GMSGeocoder, part of the GoogleMaps SDK already in use for the map
//  itself) turns the dropped pin into a human-readable address before saving. Entry point
//  of the Checkout address step. Uses Google's geocoder rather than CLGeocoder/MapKit so
//  there's a single mapping provider for the whole picker.
//

import SwiftUI
import GoogleMaps

private let limaCoordinate = CLLocationCoordinate2D(latitude: -12.0464, longitude: -77.0428)

struct AddressPickerView: View {
    @Environment(InicioCoordinator.self) private var coordinator
    @Environment(CheckoutViewModel.self) private var checkoutViewModel
    @State private var locationProvider = LocationProvider()
    @State private var coordinate = limaCoordinate
    @State private var addressLine: String = ""
    @State private var district: String = ""
    @State private var label: String = "Casa"
    @State private var reference: String = ""
    @State private var isResolvingAddress = false
    @State private var isSaving = false

    private let geocoder = GMSGeocoder()

    var body: some View {
        ZStack {
            GoogleMapView(centerCoordinate: $coordinate)
                .ignoresSafeArea(edges: .top)
                .onChange(of: coordinate.latitude) { _, _ in resolveAddress() }

            Image(systemName: "mappin")
                .font(.system(size: 36))
                .foregroundStyle(.red)
                .offset(y: -18)

            VStack {
                Spacer()
                formCard
            }
        }
        .navigationTitle("Dirección de entrega")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            locationProvider.requestLocation()
            resolveAddress()
        }
        .onChange(of: locationProvider.currentLocation?.latitude) { _, _ in
            if let location = locationProvider.currentLocation {
                coordinate = location
            }
        }
    }

    private var formCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            if isResolvingAddress {
                ProgressView().frame(maxWidth: .infinity, alignment: .center)
            } else {
                Text(addressLine.isEmpty ? "Mueve el mapa para ubicar tu dirección" : addressLine)
                    .font(.system(size: 15, weight: .semibold))
                Text(district)
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
            }

            TextField("Etiqueta (Casa, Trabajo...)", text: $label)
                .textFieldStyle(.roundedBorder)
            TextField("Referencia (opcional)", text: $reference)
                .textFieldStyle(.roundedBorder)

            Button(action: save) {
                Text(isSaving ? "Guardando..." : "Guardar dirección")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.loginHeaderOrange))
            }
            .disabled(addressLine.isEmpty || isSaving)
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 20).fill(.regularMaterial))
        .padding(16)
    }

    private func resolveAddress() {
        isResolvingAddress = true
        geocoder.reverseGeocodeCoordinate(coordinate) { response, _ in
            isResolvingAddress = false
            guard let result = response?.firstResult() else { return }
            addressLine = result.lines?.first ?? result.thoroughfare ?? ""
            district = result.locality ?? result.subLocality ?? result.administrativeArea ?? ""
        }
    }

    private func save() {
        isSaving = true
        Task {
            await checkoutViewModel.saveAddress(
                label: label.isEmpty ? "Dirección" : label,
                addressLine: addressLine,
                reference: reference.isEmpty ? nil : reference,
                district: district.isEmpty ? "Lima" : district,
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
            isSaving = false
            coordinator.showCheckoutPayment()
        }
    }
}
