//
//  SportsDataVM.swift
//  JO-PARIS-2024
//
//  Created by Manu on 30/06/2023.
//

import Foundation
import CoreLocation

// MARK: - SportsDataVM
struct SportsDataVM: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case sports = "Sports"
        case localisation = "Localisation"
        case latitude, longitude
        case startDate = "StartDate"
        case endDate = "EndDate"
        case awards = "Awards"
    }
    
    var id: UUID = UUID()
    var sports, localisation: String?
    var latitude, longitude: Double?
    var startDate, endDate: Date?
    var awards: String?

    // Ajout de la propriété calculée 'coordinate'
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude = latitude, let longitude = longitude else { return nil }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


class ReadData: ObservableObject {
    @Published var sportsDatas = [SportsDataVM]()
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
            let sportsDatas = try JSONDecoder().decode([SportsDataVM].self, from: data)
            self.sportsDatas = sportsDatas
        } catch {
            print("Failed to load and decode file: \(error.localizedDescription)")
        }
    }
}



    
/* --------  Tuto  --------
 
 https://medium.com/@nutanbhogendrasharma/read-json-data-from-file-system-in-swiftui-d054662000e
 
 */
