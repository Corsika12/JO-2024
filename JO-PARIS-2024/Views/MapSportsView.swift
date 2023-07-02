//
//  MapSportsView.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//


import SwiftUI
import MapKit
import CoreLocation

 struct MapSportsView: View {
     
     @ObservedObject var viewModel = ReadData()
     
     var body: some View {
         NavigationView {
             VStack {
                 // Choix du sport
                 List {
                     Section(header: Text("Sélectionnez les sports à afficher")) {
                         ForEach(viewModel.sportsDatas, id: \.id) { sport in
                             Button(action: {
                                 if viewModel.selectedSports.contains(sport.sports!) {
                                     viewModel.selectedSports.removeAll(where: { $0 == sport.sports! })
                                 } else {
                                     viewModel.selectedSports.append(sport.sports!)
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
                 
                 // Carte avec les sports sélectionnés
                 Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.sportsDatas.filter { viewModel.selectedSports.contains($0.sports!) }) { place in
                                     MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!)) {
                                         NavigationLink(destination: SportDetailView(sport: place)) {
                                             VStack {
                                                 Text(place.sports!)
                                             }
                                             .foregroundColor(.pink)
                                             .background(Color(.white))
                                         }
                 
                 /*
                 Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.sportsDatas.filter { viewModel.selectedSports.contains($0.sports!) }) { place in
                     MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!)) {
                         NavigationLink {
                             Text("")
                         } label: {
                             VStack {
                                 Text(place.sports!)
                             }
                             .foregroundColor(.pink)
                             .background(Color(.white))
                         }*/
                     }
                 }
             }
         }
     }
 }



struct MapSportsView_Previews: PreviewProvider {
    static var previews: some View {
        MapSportsView()
    }
}