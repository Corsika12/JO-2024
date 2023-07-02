//
//  SportDetailView.swift
//  JO-PARIS-2024
//
//  Created by M on 02/07/2023.
//

/*
import SwiftUI
import MapKit
import CoreLocation

struct SportDetailView: View {
    var sport: SportsDataModel
    
    var body: some View {
        VStack {
            Text(sport.sports ?? "")
                .font(.largeTitle)
                .padding()
            
            Text(sport.detailSport ?? "")
                .font(.body)
                .padding()
            Text("Suivez ces épreuves qui se déroulent à \(sport.localisation ?? "") du \(sport.startDate ?? "") jusqu'au \(sport.endDate ?? ""). \(sport.awards ?? "")")
        }
    }
}
*/

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
                Text(sport.sports ?? "")
                    .font(.largeTitle)
                    .padding()
                
                Text(sport.detailSport ?? "")
                    .font(.body)
                    .padding()
                
                Text("Suivez ces épreuves qui se déroulent à \(sport.localisation ?? "") du \(sport.startDate ?? "") jusqu'au \(sport.endDate ?? ""). \(sport.awards ?? "")")
                
                // Carte avec le sport sélectionné
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.sportsDatas.filter { $0.sports! == sport.sports }) { place in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!)) {
                        VStack {
//                            Image(systemName: "mappin")
                            Text("📍")
                                .font(.title)
                            
                        }
//                        .foregroundColor(.blue)
//                        .background(Color(.white))
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
        }
    }
}


 struct SportDetailView_Previews: PreviewProvider {
 static var previews: some View {
     SportDetailView(sport: SportsDataModel(), isPresented: .constant(true))
 }
 }
 
