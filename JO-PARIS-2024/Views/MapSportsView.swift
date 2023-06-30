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
            
            Map(coordinateRegion: $viewModel.region,showsUserLocation: true, annotationItems: viewModel.sportsDatas) { place in
                
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!))  {
                    
                    NavigationLink {
                        Text("")
                    } label: {
                        ZStack {
                            VStack {
                                Text(place.sports!)
                            }
                            .foregroundColor(.pink)
                            .background(Color(.white))
                        }
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
