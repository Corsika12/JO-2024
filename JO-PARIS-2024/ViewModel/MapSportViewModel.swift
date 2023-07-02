//
//  MapSportViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

// MapSportsViewModel.swift


import Foundation
import MapKit
import CoreLocation

class ReadData: ObservableObject {
    @Published var sportsDatas = [SportsDataModel]()
    @Published var selectedSports: [String] = []
    @Published var selectedDateSport: Date = Date()
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334), span: MKCoordinateSpan(latitudeDelta: 11.0, longitudeDelta: 11.0))
//    @Published var region = MKCoordinateRegion()

    // Pour mettre à jour la région basée sur le sport sélectionné
    func updateRegion(for sport: SportsDataModel) {
            guard let coordinate = sport.coordinate else { return }
            region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 1.10, longitudeDelta: 1.10))
        }

    init() {
        loadData()
    }

    func loadData() {
        guard let url = Bundle.main.url(forResource: "SportsData", withExtension: "json") else {
            print("Json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let sportsDatas = try JSONDecoder().decode([SportsDataModel].self, from: data)
            self.sportsDatas = sportsDatas
            
        } catch {
            print("Failed to load and decode file: \(error)")
        }
    }
    
    
    // Fonction filtre par sports, pour la Map
    func filterSportsByType() {
        sportsDatas = sportsDatas.filter { sport in
            guard sport.isValidSport,
                  let startDate = sport.formattedStartDate,
                  let endDate = sport.formattedEndDate
            else {
                return false
            }
            return selectedSports.contains(sport.sports!) && startDate <= selectedDateSport && selectedDateSport <= endDate
        }
    }
} // Fin de la class ReadData

    
   


/*
func updateRegion() {
    region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334), span: MKCoordinateSpan(latitudeDelta: 11.0, longitudeDelta: 11.0))
}*/
