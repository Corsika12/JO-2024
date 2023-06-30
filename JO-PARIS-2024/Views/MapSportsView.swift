//
//  MapSportsView.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

import SwiftUI
import MapKit
import CoreLocation

// MapSportsView.swift
struct MapSportsView: View {

//    @ObservedObject var viewModel = MapSportsViewModel()

    var body: some View {
        
        // A supprimer :
                VStack{
                    Text("Map")
                }
               
        }
    } // fin de la partie à supprimer
        
        /* A fiabiliser :
        
        Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.sportsDatas) { place in
            MapMarker(coordinate: place.coordinate ?? CLLocationCoordinate2D(), tint: .red)
            MapAnnotation(coordinate: place.coordinate ?? CLLocationCoordinate2D()) {
                VStack {
                    Text(place.sports ?? "Unknown")
                }
            }
        }
    }
}
*/


struct MapSportsView_Previews: PreviewProvider {
    static var previews: some View {
        MapSportsView()
    }
}
