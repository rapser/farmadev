//
//  ProfileEditView.swift
//  farmedev
//

import SwiftUI

struct ProfileEditView: View {
    @Environment(AppState.self) private var appState
    @State private var viewModel: ProfileEditViewModel?

    var body: some View {
        Group {
            if let viewModel {
                form(viewModel)
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Mi perfil")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if viewModel == nil { viewModel = ProfileEditViewModel(appState: appState) }
        }
    }

    private func form(_ viewModel: ProfileEditViewModel) -> some View {
        @Bindable var vm = viewModel
        return VStack(alignment: .leading, spacing: 16) {
            TextField("Nombres", text: $vm.fullName).textFieldStyle(.roundedBorder)
            TextField("Apellidos", text: $vm.surname).textFieldStyle(.roundedBorder)
            TextField("Teléfono", text: $vm.phone).textFieldStyle(.roundedBorder).keyboardType(.phonePad)

            if let errorMessage = vm.errorMessage {
                Text(errorMessage).foregroundStyle(.red).font(.system(size: 13))
            }
            if vm.didSave {
                Text("Perfil actualizado.").foregroundStyle(.green).font(.system(size: 13))
            }

            Button(action: { Task { await vm.save(appState: appState) } }) {
                Text(vm.isSaving ? "Guardando..." : "Guardar cambios")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.loginHeaderOrange))
            }
            .disabled(vm.isSaving)

            Spacer()
        }
        .padding(16)
    }
}
