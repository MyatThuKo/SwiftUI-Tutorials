//
//  CreditsView.swift
//  Africa
//
//  Created by Myat Thu Ko on 3/16/21.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: .center)
            Text("""
    Copyright © Myat Thu Ko
    All right reserved
    Better Apps ♡ Less Code
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}

// MARK: - PREVIEW

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
