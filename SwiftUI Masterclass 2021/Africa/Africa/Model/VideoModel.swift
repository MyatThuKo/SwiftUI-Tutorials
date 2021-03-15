//
//  VideoModel.swift
//  Africa
//
//  Created by Myat Thu Ko on 3/14/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
