//
//  Sports2DataModel.swift
//  JO-PARIS-2024
//
//  Created by M on 06/07/2023.
//


/*
 
 import Foundation
 import CoreLocation
 
 // Nouvelle structure de données JSON pour éviter les doublons de sports, avec un tableau Detail
 struct Sports2DataModel: Codable, Identifiable {
 var id: UUID = UUID()
 var sports, icone: String?
 var startDate, eventDate, endDate: String?
 var awards: String?
 var details: [Detail2DataModel]
 var detailSport: String?
 var isValidSport: Bool {
 return sports != nil
 }
 
 enum CodingKeys: String, CodingKey {
 /*
  case sports
  case icone
  case startDate
  case eventDate
  case endDate
  case awards
  case details
  case detailSport
  */
 
 
 case sports = "Sports"
 case icone = "Icone"
 case startDate = "StartDate"
 case eventDate = "EventDate"
 case endDate = "EndDate"
 case awards = "Awards"
 case details = "Details"
 case detailSport = "DetailSport"
 
 
 }
 
 // Format anglais pour afficher sur DatePicker
 var formattedStartDate: Date? {
 let dateFormatter = DateFormatter()
 dateFormatter.locale = Locale(identifier: "en_US")
 dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
 dateFormatter.dateFormat = "MM/dd/yy"
 return dateFormatter.date(from: self.startDate ?? "")
 }
 
 var formattedEndDate: Date? {
 let dateFormatter = DateFormatter()
 dateFormatter.locale = Locale(identifier: "en_US")
 dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
 dateFormatter.dateFormat = "MM/dd/yy"
 return dateFormatter.date(from: self.endDate ?? "")
 }
 }
 
 
 
 // MARK: - Detail pour gérer plusieurs localisations
 struct Detail2DataModel: Codable {
 var localisation: String?
 var latitude, longitude: Double?
 
 enum CodingKeys: String, CodingKey {
 //        case localisation = "Localisation"
 case localisation
 case latitude, longitude
 }
 
 // Ajout de la propriété calculée 'coordinate'
 var coordinate: CLLocationCoordinate2D? {
 guard let latitude = latitude, let longitude = longitude else { return nil }
 return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
 }
 }
 
 */
