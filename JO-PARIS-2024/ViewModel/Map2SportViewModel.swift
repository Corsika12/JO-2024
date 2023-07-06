//
//  Map2SportViewModel.swift
//  JO-PARIS-2024
//
//  Created by Manu on 06/07/2023.
//


/*
 
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
 func updateRegion(for sport: Detail2DataModel) {
 guard let coordinate = sport.coordinate else { return }
 defaultRegion.center = coordinate
 }
 
 init() {
 load2Data()
 }
 
 
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
 
 // Format date JJ MM AAAA
 func formatFrenchDate(date: Date) -> String {
 let dateFormatter = DateFormatter()
 dateFormatter.locale = Locale(identifier: "fr_FR")
 dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
 dateFormatter.dateFormat = "dd MMMM yyyy"
 return dateFormatter.string(from: date)
 
 
 
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
 }
 } // Fin de la class ReadData
 
 */
