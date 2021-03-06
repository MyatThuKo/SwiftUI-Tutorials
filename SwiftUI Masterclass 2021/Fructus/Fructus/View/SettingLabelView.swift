//
//  SettingLabelView.swift
//  Fructus
//
//  Created by Myat Thu Ko on 3/5/21.
//

import SwiftUI

struct SettingLabelView: View {
    // MARK: - PROPERTIES
    
    var labelText: String
    var labelImage: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

// MARK: - PREVIEW
struct SettingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingLabelView(labelText: "Fructus", labelImage: "info.circle")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
