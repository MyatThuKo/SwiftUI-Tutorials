//
//  SignInWithGoogleButton.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/24/21.
//

import Foundation
import GoogleSignIn
import SwiftUI

struct SignInWithGoogleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        let button = GIDSignInButton()
        // Customize button here
        button.colorScheme = .light
        button.style = .wide
        return button
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
