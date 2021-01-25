//
//  SignInView.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/24/21.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Thank you for using To Do List app. Please sign in here.")
            SignInWithAppleButton()
                .frame(width: 280, height: 45)
                .onTapGesture {
                    print("Sign in with Apple")
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
