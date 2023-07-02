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
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
    
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
            print("Failed to load and decode file: \(error.localizedDescription)")
        }
    }
    
    // Calcul du centre et de l'étendue de la région de la carte dans le ViewModel
    func updateRegion() {
                region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
        }
    
    
    // Afficher une seule ville sur la Map si 1 seule localisation
        func adjustRegionForSingleCity(coordinate: CLLocationCoordinate2D) {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Ajuster ces valeurs pour modifier le niveau de zoom pour une seule ville
            region = MKCoordinateRegion(center: coordinate, span: span)
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
        updateRegion()
    }

    // Fonction filtre par date pour Seraphin
    func filterSportsByDate() {
        sportsDatas = sportsDatas.filter { sport in
            guard sport.isValidSport,
                  let startDate = sport.formattedStartDate,
                  let endDate = sport.formattedEndDate
            else {
                return false
            }
            return selectedSports.contains(sport.sports!) && startDate <= selectedDateSport && selectedDateSport <= endDate
        }
        updateRegion()
    }
}




/*
import Foundation
import MapKit
import CoreLocation

class ReadData: ObservableObject {
    @Published var sportsDatas = [SportsDataModel]()
    @Published var selectedSports: [String] = [] // Selectionner un ou des sports pour afficher les lieux sur la Map
    @Published var selectedDateSport: Date = Date() // Initialise avec la date d'aujourd'hui
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46.603354, longitude: 1.888334), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "SportsData", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let sportsDatas = try JSONDecoder().decode([SportsDataModel].self, from: data)
            self.sportsDatas = sportsDatas
        } catch {
            print("Failed to load and decode file: \(error.localizedDescription)")
        }
    }
    
    // Fonction pour filtrer les sports par date
    func filterSportsByDate() {
        sportsDatas = sportsDatas.filter { sport in
            guard let startDate = sport.formattedStartDate, let endDate = sport.formattedEndDate else {
                return false
            }
            
            return startDate <= selectedDateSport && selectedDateSport <= endDate
        }
    }
}
*/
