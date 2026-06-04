//
//  CompleteSignInRequest.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CompleteSignInRequest {
    let provider: AuthenticationProvider
    let email: String
    let accessToken: String
    let idToken: String?
}
