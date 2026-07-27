//
//  CheckoutViewModel.swift
//  farmedev
//
//  Shared state across the checkout steps (address -> payment -> summary), injected via
//  @Environment at the coordinator root so it survives across pushed destinations.
//

import Foundation

enum CheckoutPaymentMethod: String {
    case cash
    case card
}

@Observable
final class CheckoutViewModel {
    var addresses: [ShippingAddress] = []
    var selectedAddress: ShippingAddress?
    var paymentMethod: CheckoutPaymentMethod = .cash
    var isPlacingOrder = false
    var errorMessage: String?
    var createdOrder: StoreOrder?

    private let addressUseCase: ShippingAddressUseCase
    private let orderUseCase: StoreOrderUseCase

    init(addressUseCase: ShippingAddressUseCase = ShippingAddressUseCase(), orderUseCase: StoreOrderUseCase = StoreOrderUseCase()) {
        self.addressUseCase = addressUseCase
        self.orderUseCase = orderUseCase
    }

    func loadAddresses() async {
        addresses = (try? await addressUseCase.list()) ?? []
        if selectedAddress == nil {
            selectedAddress = addresses.first(where: { $0.isDefault }) ?? addresses.first
        }
    }

    func saveAddress(label: String, addressLine: String, reference: String?, district: String, latitude: Double?, longitude: Double?) async {
        let isFirst = addresses.isEmpty
        if let created = try? await addressUseCase.create(
            label: label, addressLine: addressLine, reference: reference, district: district,
            latitude: latitude, longitude: longitude, isDefault: isFirst
        ) {
            addresses.append(created)
            selectedAddress = created
        }
    }

    func placeOrder() async -> Bool {
        guard let address = selectedAddress else {
            errorMessage = "Selecciona una dirección de entrega."
            return false
        }
        isPlacingOrder = true
        errorMessage = nil
        defer { isPlacingOrder = false }

        do {
            let order = try await orderUseCase.createOrder(
                addressLine: address.addressLine,
                district: address.district,
                reference: address.reference,
                paymentMethod: paymentMethod.rawValue
            )
            createdOrder = order
            return true
        } catch {
            errorMessage = "No se pudo completar el pedido. Intenta nuevamente."
            return false
        }
    }
}
