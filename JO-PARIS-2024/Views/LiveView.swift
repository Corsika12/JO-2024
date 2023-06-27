//
//  LiveView.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import SwiftUI
import AVKit

struct LiveView: View {
    @State private var player: AVPlayer?
    var videoURL: String = "https://www.youtube.com/embed/PbYny-d9lrw"

    var body: some View {
        VideoPlayer(player: player, videoOverlay: {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Video en live")
                        .foregroundColor(.white)
                        .padding(10)
                }
            }
        })
        .onAppear {
            guard let url = URL(string: videoURL) else {
                return
            }
            player = AVPlayer(url: url)
            player?.play()
        }
        .onDisappear {
            player?.pause()
        }
        .frame(height: 400)
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}


/* --------  Tuto  --------

A étudier : https://mia-e.medium.com/how-to-add-a-video-player-in-your-swiftui-app-using-avkit-beginner-tutorial-ffce69af486

*/
