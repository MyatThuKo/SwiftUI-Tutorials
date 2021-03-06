//
//  SettingRowView.swift
//  Fructus
//
//  Created by Myat Thu Ko on 3/5/21.
//

import SwiftUI

struct SettingRowView: View {
    // MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 5)
            
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.blue)
                }
                else {
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingRowView(name: "Developer", content: "John Doe")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingRowView(name: "Website", linkLabel: "Portfolio", linkDestination: "myatthuko.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
