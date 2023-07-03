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
                Map(coordinateRegion: $viewModel.defaultRegion, showsUserLocation: true, annotationItems: viewModel.sportsDatas.filter { $0.sports! == sport.sports }) { place in
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
                .onAppear {
                    let sports = viewModel.sportsDatas.filter { $0.sports! == sport.sports }
                    
                    if sports.count == 1 {
                        viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: 1.1, longitudeDelta: 1.1)
                        viewModel.defaultRegion.center = sport.coordinate!
                    }
                    /*
                    else if sports.count == 2 || sports.count == 3 {
                        // Zoom et centre par rapport à un tableau de coordonnées
                        let sumLatitude = sports.compactMap({ $0.latitude }).reduce(0, +)
                               let sumLongitude = sports.compactMap({ $0.longitude }).reduce(0, +)
                               let meanLatitude = sumLatitude / Double(sports.count)
                               let meanLongitude = sumLongitude / Double(sports.count)
                               
                               // Définir le centre de la carte à ces moyennes
                               viewModel.defaultRegion.center = CLLocationCoordinate2D(latitude: meanLatitude, longitude: meanLongitude)
                               
                               // Ajuster le niveau de zoom en fonction du nombre de coordonnées
                               viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: 3.5, longitudeDelta: 3.5)
                    }*/
                    
                    else if sports.count == 2 || sports.count == 3 {
                            // Calculer les moyennes de latitude et de longitude
                            let sumLatitude = sports.compactMap({ $0.latitude }).reduce(0, +)
                            let sumLongitude = sports.compactMap({ $0.longitude }).reduce(0, +)
                            let meanLatitude = sumLatitude / Double(sports.count)
                            let meanLongitude = sumLongitude / Double(sports.count)
                                                
                            // Calculer les écarts entre les latitudes et les longitudes
                            let maxLatitude = sports.compactMap({ $0.latitude }).max() ?? meanLatitude
                            let minLatitude = sports.compactMap({ $0.latitude }).min() ?? meanLatitude
                            let maxLongitude = sports.compactMap({ $0.longitude }).max() ?? meanLongitude
                            let minLongitude = sports.compactMap({ $0.longitude }).min() ?? meanLongitude
                        let latitudeDelta = (maxLatitude - minLatitude) + 0.4
                            let longitudeDelta = (maxLongitude - minLongitude) + 0.4
                                                
                            // Définir le centre de la carte à ces moyennes
                            viewModel.defaultRegion.center = CLLocationCoordinate2D(latitude: meanLatitude, longitude: meanLongitude)
                                                
                            // Ajuster le niveau de zoom en fonction des écarts de coordonnées
                            viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
                        }
                    
                    
                    else {
                        viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: 11.0, longitudeDelta: 11.0)
                        viewModel.defaultRegion.center = CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334)
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


/*
struct SportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SportDetailView(sport: SportsDataModel(), isPresented: .constant(true))
    }
}
*/
