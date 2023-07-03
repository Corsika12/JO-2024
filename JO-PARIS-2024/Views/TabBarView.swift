//
//  TabBarView.swift
//  JO-PARIS-2024
//
//  Created by Manu on 21/06/2023.
//
// --------  Tab Bar pour tous les écrans  --------

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: Int = 0
    
    // Couleur de fond de la TabBar
    init() {
            UITabBar.appearance().barTintColor = UIColor(.white)
        }
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
                    NewsView()
                        .tabItem{
                            Label("Actus", systemImage: "newspaper")
                                .environment(\.symbolVariants, .none)
                                .opacity(selectedTab == 0 ? 1 : 0.5)
                        }.tag(0)

                    LiveView()
                        .tabItem{
                            Label("Live", systemImage: "play.square.stack")
                                .environment(\.symbolVariants, .none)
                                .opacity(selectedTab == 1 ? 1 : 0.5)
                                
                        }.tag(1)

                    EventsView()
                        .tabItem{
                            Label("Evènements", systemImage: "calendar.badge.clock")
                                .environment(\.symbolVariants, .none)
                                .opacity(selectedTab == 2 ? 1 : 0.5)
                        }.tag(2)

                    ProfilView()
                        .tabItem{
                            Label("Profil", systemImage: "person")
                                .environment(\.symbolVariants, .none)
                                .opacity(selectedTab == 3 ? 1 : 0.5)
                        }.tag(3)
                }
        .tint(Color("Apache"))
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(SportViewModel())
            .environmentObject(AthleteViewModel())
    }
}
