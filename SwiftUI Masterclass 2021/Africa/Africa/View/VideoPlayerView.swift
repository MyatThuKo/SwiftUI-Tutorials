//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Myat Thu Ko on 3/14/21.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    
    let videoSelected: String
    let videoTitle: String
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                 Text(videoTitle)
                    .foregroundColor(.accentColor)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        } //: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

// MARK: - PREVIEW

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "giraffe", videoTitle: "Giraffe")
        }
    }
}
