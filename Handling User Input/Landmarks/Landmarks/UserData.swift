//
//  UserData.swift
//  Landmarks
//
//  Created by Myat Thu Ko on 11/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
