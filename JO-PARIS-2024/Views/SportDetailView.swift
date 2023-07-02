//
//  SportDetailView.swift
//  JO-PARIS-2024
//
//  Created by Manu on 02/07/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct SportDetailView: View {
    var sport: SportsDataModel
    @ObservedObject var viewModel = ReadData()
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(sport.sports ?? "")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Du \(sport.startDate ?? "") au \(sport.endDate ?? ""). \(sport.awards ?? "")")
                }
                .padding()
                
                // Carte avec le sport sélectionné
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.sportsDatas.filter { $0.sports! == sport.sports }) { place in
                            MapAnnotation(coordinate: place.coordinate!) { // Utilisez la propriété 'coordinate' du modèle
                                VStack {
                            //                            Image(systemName: "mappin")
                            Text("📍")
                                .font(.title)
                            Text("\(place.localisation!)")
                                .font(.system(size: 14))
                                .foregroundColor(Color("Zeus"))
                                .background(Color.white.opacity(0.5))
                        }
                    }
                }
                
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Fermer")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }.onAppear {
            viewModel.loadData()
        }
    }
}


struct SportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SportDetailView(sport: SportsDataModel(), isPresented: .constant(true))
    }
}
