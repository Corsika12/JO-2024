//
//  ArrayCountries.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation


struct Country: Identifiable {
    var id: UUID = UUID()
    var country: String // Enumérations d'une 10 aine de pays
    var abrevCountry: String // Abréviation du pays (ex : Fr)
    var flagCountry: String // Drapeaux à ajouter dans les Assets

}
