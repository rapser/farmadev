//
//  AddressSearchView.swift
//  farmedev
//

import SwiftUI

private struct AddressSuggestion: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let district: String
}

struct AddressSearchView: View {
    @Environment(AppState.self) private var appState
    @Environment(InicioCoordinator.self) private var coordinator

    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool

    private let allSuggestions: [AddressSuggestion] = [
        .init(name: "Jirón Ignacio Seminario", district: "San Juan de Miraflores"),
        .init(name: "Jirón Ignacio Seminario Cuadra 10", district: "15824 San Juan de Miraflores"),
        .init(name: "Jirón Ignacio Seminario Cuadra 5", district: "15801 San Juan de Miraflores"),
        .init(name: "Jirón Ignacio Seminario Cuadra 4", district: "15801 San Juan de Miraflores"),
        .init(name: "Jirón Ignacio Seminario Cuadra 6", district: "15801 San Juan de Miraflores"),
        .init(name: "Jirón Pedro Villalobos", district: "San Juan de Miraflores"),
        .init(name: "Av. Javier Prado Este", district: "San Isidro, Lima"),
        .init(name: "Av. Larco", district: "Miraflores, Lima"),
        .init(name: "Jr. Huancavelica", district: "Cercado de Lima"),
        .init(name: "Av. Benavides", district: "Miraflores, Lima"),
    ]

    private var suggestions: [AddressSuggestion] {
        let query = searchText.trimmingCharacters(in: .whitespaces).lowercased()
        guard !query.isEmpty else { return [] }
        return allSuggestions.filter {
            $0.name.lowercased().contains(query) || $0.district.lowercased().contains(query)
        }
    }

    private var isSearching: Bool {
        !searchText.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                searchField
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)

                if isSearching {
                    searchResultsList
                } else {
                    currentLocationCard
                }

                Spacer()
            }

            if isSearching {
                disclaimer
            }
        }
        .navigationTitle("Agregar una dirección")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { coordinator.pop() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.primary)
                }
            }
        }
        .onAppear { isSearchFocused = true }
    }

    // MARK: - Search field

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "mappin")
                .font(.system(size: 16))
                .foregroundStyle(Color(.systemGray3))
            TextField("Buscar por dirección, distrito o provincia", text: $searchText)
                .font(.system(size: 15))
                .focused($isSearchFocused)
                .submitLabel(.search)
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color(.systemGray3))
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray5), lineWidth: 1))
        .cornerRadius(10)
    }

    // MARK: - Current location (empty state)

    private var currentLocationCard: some View {
        Button(action: {
            appState.defaultAddress = "Jirón Pedro Villalobos 1118"
            coordinator.pop()
        }) {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(Color(red: 0.45, green: 0.35, blue: 0.75))
                        .frame(width: 44, height: 44)
                    Image(systemName: "location.fill")
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("Mi ubicación actual")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.primary)
                    Text(appState.defaultAddress + ", San Juan Zona C2")
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
                Spacer()
            }
            .padding(16)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 6, y: 2)
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 16)
    }

    // MARK: - Results list

    private var searchResultsList: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(suggestions) { suggestion in
                    Button(action: {
                        appState.defaultAddress = suggestion.name
                        coordinator.pop()
                    }) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(suggestion.name)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.primary)
                            Text(suggestion.district)
                                .font(.system(size: 13))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                    }
                    .buttonStyle(.plain)

                    Divider().padding(.leading, 16)
                }

                // No encontré la dirección
                Button(action: {}) {
                    HStack(spacing: 12) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 18))
                            .foregroundStyle(Color(.systemGray3))
                        VStack(alignment: .leading, spacing: 3) {
                            Text("¿No encuentras la dirección?")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.primary)
                            Text("Fija la ubicación en el mapa")
                                .font(.system(size: 13))
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                }
                .buttonStyle(.plain)
            }
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 6, y: 2)
            .padding(.horizontal, 16)
            .padding(.bottom, 60)
        }
    }

    // MARK: - Bottom disclaimer

    private var disclaimer: some View {
        HStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 13))
                .foregroundStyle(Color(.systemGray3))
            Text("Si no encuentras tu dirección, prueba buscando primero tu provincia")
                .font(.system(size: 12))
                .foregroundStyle(Color(.systemGray2))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
