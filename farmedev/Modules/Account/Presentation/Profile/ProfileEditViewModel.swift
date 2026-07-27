//
//  ProfileEditViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class ProfileEditViewModel {
    var fullName: String = ""
    var surname: String = ""
    var phone: String = ""
    var isSaving = false
    var didSave = false
    var errorMessage: String?

    private let authUseCase: AppAuthUseCase

    init(appState: AppState, authUseCase: AppAuthUseCase = AppAuthUseCase()) {
        self.authUseCase = authUseCase
        fullName = appState.userFullName
        surname = appState.userSurname
    }

    func save(appState: AppState) async {
        isSaving = true
        errorMessage = nil
        defer { isSaving = false }

        do {
            let user = try await authUseCase.updateProfile(fullName: fullName, surname: surname, phone: phone.isEmpty ? nil : phone)
            appState.applyUpdatedProfile(fullName: user.fullName, surname: user.surname)
            didSave = true
        } catch {
            errorMessage = "No se pudo guardar el perfil. Intenta nuevamente."
        }
    }
}
