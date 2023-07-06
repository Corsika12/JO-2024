//
//  Map2SportViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 06/07/2023.
//

import Foundation
import MapKit
import CoreLocation

class Read2Data: ObservableObject {
    @Published var sportsDatas = [Sports2DataModel]()
    @Published var selectedSports: [String] = []
    @Published var selectedDateSport: Date = Date()
    
    @Published var mapRegion = CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334)
    
    @Published var defaultRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334), span: MKCoordinateSpan(latitudeDelta: 11.0, longitudeDelta: 11.0))
    
    
    // Pour mettre à jour la région basée sur le sport sélectionné
    // Fonction à mettre à jour :
    
    /*
     func updateRegion(for sport: SportsDataModel) {
             guard let coordinate = sport.coordinate else { return }
         defaultRegion.center = coordinate
         }
     
     init() {
         loadData()
     }
     */
    
    
    func load2Data() {
        guard let url = Bundle.main.url(forResource: "SportsData", withExtension: "json") else {
            print("Json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let sportsDatas = try JSONDecoder().decode([Sports2DataModel].self, from: data)
            self.sportsDatas = sportsDatas
            
        } catch {
            print("Failed to load and decode file: \(error)")
        }
    }
}
