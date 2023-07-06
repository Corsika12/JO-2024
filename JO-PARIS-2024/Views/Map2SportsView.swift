//
//  Map2SportsView.swift
//  JO-PARIS-2024
//
//  Created by M on 06/07/2023.
//

/*

import SwiftUI
import MapKit
import CoreLocation



struct Map2SportsView: View {
    @ObservedObject var viewModel = Read2Data()
    @State private var selectedSport: Sports2DataModel?
    @State private var showingDetailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Choix du sport
                List {
                    Section(header: Text("Sélectionnez le sport à afficher")) {
                        ForEach(viewModel.sportsDatas, id: \.id) { sport in
                            Button(action: {
                                if viewModel.selectedSports.contains(sport.sports!) {
                                    viewModel.selectedSports.removeAll(where: { $0 == sport.sports! })
                                } else {
                                    viewModel.selectedSports.append(sport.sports!)
                                    self.selectedSport = sport
                                    viewModel.updateRegion(for: sport)  // Appeler la méthode updateRegion lorsque le sport est sélectionné
                                    self.showingDetailView = true
                                }
                            }) {
                                HStack {
                                    Text(sport.sports ?? "")
                                    if viewModel.selectedSports.contains(sport.sports!) {
                                        Spacer()
                                        Image(systemName: "checkmark").foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .fullScreenCover(isPresented: $showingDetailView) {
                    if let sport = self.selectedSport {
                        SportDetailView(sport: sport, isPresented: self.$showingDetailView)
                    }
                }
            }
        }
    }
}


struct Map2SportsView_Previews: PreviewProvider {
    static var previews: some View {
        Map2SportsView()
    }
}

 */
