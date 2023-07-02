//
//  SportsDataVM.swift
//  JO-PARIS-2024
//
//  Created by Manu on 30/06/2023.
//

import Foundation
import CoreLocation

struct SportsDataModel: Codable, Identifiable {
    var id: UUID = UUID()
    var sports, localisation: String?
    var latitude, longitude: Double?
    var startDate, endDate: String?
    var awards: String?
    var detailSport: String? 
    var isValidSport: Bool {
        return sports != nil
    }
    
    enum CodingKeys: String, CodingKey {
        case sports = "Sports"
        case localisation = "Localisation"
        case latitude, longitude
        case startDate = "StartDate"
        case endDate = "EndDate"
        case awards = "Awards"
    }
    
    var formattedStartDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: self.startDate ?? "")
    }
    
    var formattedEndDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: self.endDate ?? "")
    }
    // Ajout de la propriété calculée 'coordinate'
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude = latitude, let longitude = longitude else { return nil }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}



/* --------  Tuto  --------
 
 https://medium.com/@nutanbhogendrasharma/read-json-data-from-file-system-in-swiftui-d054662000e
 
 */
