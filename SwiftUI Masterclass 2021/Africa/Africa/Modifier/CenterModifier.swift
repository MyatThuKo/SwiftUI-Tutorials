//
//  CenterModifier.swift
//  Africa
//
//  Created by Myat Thu Ko on 3/31/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
