//
//  ArrayCountries.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation


struct Country: Identifiable {
    var id: UUID = UUID()
    var country: String // Enumérations des pays
    var continent: String // Les 5 continents
    var codeCountry: String // Abréviation du pays (ex : Fr)
    var flagCountry: String // Drapeaux à ajouter dans les Assets

}

let italy = Country(country: "Italie",continent: "Europe", codeCountry: "IT", flagCountry: "italy")
let southAfrica = Country(country: "Afrique du Sud",continent: "Afrique", codeCountry: "SA", flagCountry: "south africa")
let japan = Country(country: "Japon", continent: "Asie", codeCountry: "JP", flagCountry: "japan")
let brazil = Country(country: "Brésil",continent: "Amérique du Sud", codeCountry: "BR", flagCountry: "brazil")
let newZeland = Country(country: "Nouvelle-Zélande", continent: "Océanie", codeCountry: "NZ", flagCountry: "new zeland")

let countries : [Country] = [italy, southAfrica, japan, brazil, newZeland]

/* --------  To Do  --------
 
 Possibilité de convertir Excel en JSON
 
 */
