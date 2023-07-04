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
    // Formatage de la date en utilisant la fonction dans MapSportsViewModel
    @ObservedObject var viewModel = ReadData()
    //
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            self.isPresented = false
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .padding(.leading, 16)
                                Spacer ()
                                
                                // Title du sport
                                HStack {
                                    Text(sport.sports!)
//                                        .font(.title2)
                                     .font(Font.custom("Paris2024-Variable", size: 24))
                                        .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                                        .padding(.leading, -32)
                                }
                                Spacer ()
                            }
                            .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 32)
                    }
                    
                        VStack{
                            Text("Du \(viewModel.formatFrenchDate(date: sport.formattedStartDate!)) au \(viewModel.formatFrenchDate(date: sport.formattedEndDate!))")
                                .foregroundColor(Color("Zeus"))
                                .fontWeight(.semibold)
                            Text("\n\(sport.awards ?? "")")
                                .foregroundColor(Color("Zeus").opacity(0.7))
                                .padding(.bottom, 24)
                        }
//                        .padding(.bottom, 24)
                }
                
                // Carte avec le sport sélectionné
                Map(coordinateRegion: $viewModel.defaultRegion, showsUserLocation: true, annotationItems: viewModel.sportsDatas.filter { $0.sports! == sport.sports }) { place in
                    MapAnnotation(coordinate: place.coordinate!) { // Utilisez la propriété 'coordinate' du modèle
                        VStack {
                            //                            Image(systemName: "mappin")
                            Text("📍")
                                .font(.title)
//                                .foregroundColor(Color("RougeAmour"))
                            Text("\(place.localisation!)")
//                                .font(Font.custom("Paris2024-Variable"
                                .foregroundColor(Color("Zeus"))
                                .font(.system(size: 14))
                                .fontWeight(.medium)
                                .padding(4)
                                .background(Color.white.opacity(0.95))
                                
                        }
                        //                        .padding()
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    let sports = viewModel.sportsDatas.filter { $0.sports! == sport.sports }
                    
                    if sports.count == 1 {
                        viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: 1.1, longitudeDelta: 1.1)
                        viewModel.defaultRegion.center = sport.coordinate!
                    }
                    
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
                        viewModel.defaultRegion.span = MKCoordinateSpan(latitudeDelta: 12.50, longitudeDelta: 12.50)
                        viewModel.defaultRegion.center = CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334)
                    }
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
 SportDetailView(sport: SportsDataModel("XXX"), isPresented: .constant(true))
 }
 }
 */
