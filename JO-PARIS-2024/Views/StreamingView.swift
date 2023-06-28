//
//  StreamingView.swift
//  JO-PARIS-2024
//
//  Created by M on 28/06/2023.
//

import SwiftUI
import WebKit
import MediaPlayer
import AudioToolbox

struct StreamingView: View {
    var body: some View {
        VStack {
            CollectionView()
        }
        .navigationTitle("Qualifications aux JO")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoStreamingView: UIViewRepresentable {
    let videoId: String

    func makeUIView(context: Context) ->  WKWebView {
        let webview = WKWebView()
//        if URL youtube
        guard let videoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return webview }
//        else
//        guard let videoURL = URL(string: "https://www.dailymotion.com/embed/video/\(videoId)") else { return webview }
        
        let request = URLRequest(url: videoURL, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
        webview.scrollView.isScrollEnabled = false
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

struct CollectionView: View {
//    Youtube
    let ids = ["qGAf6xsFFSs", "SINpbLxXNgw", "PbYny-d9lrw", "mYMuWTKHZus"]
    
//    Dailymotion ids
//    let ids = ["x8ew4nz"]

    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(ids, id:\.self) { idData in
                    VideoStreamingView(videoId: idData)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                }
            }
        }
    }
}

/*
 struct StreamingView_Previews: PreviewProvider {
 static var previews: some View {
 StreamingView()
 }
 }
 */
