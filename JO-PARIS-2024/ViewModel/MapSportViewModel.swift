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
}
