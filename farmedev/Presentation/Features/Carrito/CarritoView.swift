//
//  CarritoView.swift
//  farmedev
//

import SwiftUI

struct CarritoView: View {
    @Environment(InicioCoordinator.self) private var coordinator
    @State private var selectedTab: CarritoTab = .carrito

    var body: some View {
        VStack(spacing: 0) {
            CarritoAddressStrip()
            Divider()

            ScrollView {
                VStack(spacing: 16) {
                    VStack(spacing: 0) {
                        CarritoTabSelector(selectedTab: $selectedTab)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                        CarritoEmptyState(selectedTab: selectedTab)
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
                    .padding(.top, 16)

                    CarritoSuggestedSection()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 100)
            }
            .background(Color(.systemGroupedBackground))
        }
        .navigationTitle("Mi carrito")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { coordinator.pop() }) {
                    Image(systemName: "chevron.left").font(.system(size: 18, weight: .semibold)).foregroundStyle(.primary)
                }
            }
        }
    }
}
