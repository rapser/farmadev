//
//  AddressesListView.swift
//  farmedev
//
//  Reuses Modules/Checkout's address CRUD (ShippingAddressUseCase) — "Mis direcciones"
//  in Cuenta is just a read/delete view over the same backend data checkout writes to.
//

import SwiftUI

struct AddressesListView: View {
    @State private var addresses: [ShippingAddress] = []
    @State private var isLoading = false
    private let useCase = ShippingAddressUseCase()

    var body: some View {
        ScrollView {
            if addresses.isEmpty && !isLoading {
                Text("No tienes direcciones guardadas todavía. Se agregan desde el checkout.")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.top, 60)
            } else {
                VStack(spacing: 12) {
                    ForEach(addresses) { address in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(address.label).font(.system(size: 14, weight: .semibold))
                                Text(address.addressLine).font(.system(size: 13)).foregroundStyle(.secondary)
                                Text(address.district).font(.system(size: 12)).foregroundStyle(.secondary)
                            }
                            Spacer()
                            Button {
                                Task { await delete(address) }
                            } label: {
                                Image(systemName: "trash").foregroundStyle(.secondary)
                            }
                        }
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                    }
                }
                .padding(16)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mis direcciones")
        .navigationBarTitleDisplayMode(.inline)
        .task { await load() }
    }

    private func load() async {
        isLoading = true
        addresses = (try? await useCase.list()) ?? []
        isLoading = false
    }

    private func delete(_ address: ShippingAddress) async {
        try? await useCase.delete(id: address.id)
        await load()
    }
}
