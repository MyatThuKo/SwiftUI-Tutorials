//
//  VideoListView.swift
//  Africa
//
//  Created by Myat Thu Ko on 3/9/21.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImapct = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 10)
                    }
                } //: ForEach
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Shuffle videos
                        videos.shuffle()
                        hapticImapct.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        } //: NavigationView
    }
}

// MARK: - PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
