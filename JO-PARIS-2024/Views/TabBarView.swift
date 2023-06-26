//
//  TabBarView.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import SwiftUI

// --------  Tab Bar pour tous les écrans  --------
// by Manu

struct TabBarView: View {
    
    
    var body: some View {
        
        TabView {
            NewsView()
                .tabItem{
                    Label("Actus", systemImage: "newspaper")
                        .environment(\.symbolVariants, .none)
                }
            LiveView()
                .tabItem{
                    Label("Live", systemImage: "play.square.stack")
                        .environment(\.symbolVariants, .none)
                }
            EventsView()
                .tabItem{
                    Label("Evènements", systemImage: "calendar.badge.clock")
                        .environment(\.symbolVariants, .none)
                }
            ProfilView()
                .tabItem{
                    Label("Profil", systemImage: "person")
                        .environment(\.symbolVariants, .none)
                }
        }
        .tint(Color("Apache"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
