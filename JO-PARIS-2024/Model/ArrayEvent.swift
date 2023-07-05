//
//  ArrayEvents.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation

// Structure des événements

struct Event: Identifiable {
    var id: UUID = UUID()
    var sport: Sport // Discipline (ex : BMX freestyle)
    var epreuve: String
    
    var lieu: String // Site de l'évènement (ex : Site d’escalade du Bourget) ;
    
    var awards: String // (ex : Des remises de médailles sont prévues dans les sessions du 6, 7, 8, 9 et 10 août.)
    
    var paralympique: Bool // Identifications des événements paralympiques
    var dateEvent: Date // Date de la compétition
    var hourEvent: Date?  // à voir si besoin d'une énumération ou un autre modèle de date ?
    // Voir pour les scores, podiums... ?
}

var userLocale = Locale.autoupdatingCurrent
var userCalendar = Calendar.autoupdatingCurrent

let dateRange : ClosedRange<Date> = {
    let calendar = Calendar.autoupdatingCurrent
    let startComponents = DateComponents(year: 2024, month: 7, day: 26)
    let endComponents = DateComponents(year: 2024, month : 9, day: 8)
    return calendar.date(from: startComponents)!...calendar.date(from: endComponents)!
}()

var climbing0Components = DateComponents(
    year: 2024,
    month: 7,
    day: 30,
    hour: 16,
    minute: 15
)

var handball0Components = DateComponents(
    year: 2024,
    month: 8,
    day: 6,
    hour: 20,
    minute: 00
)

var tennis0 = Event(sport: tennis, epreuve: "Quarts de finale Femmes", lieu: "Paris", awards: "", paralympique: false, dateEvent: userCalendar.date(from: DateComponents(year: 2024, month: 8, day: 5, hour: 18, minute: 0))!)

var openingCeremonyComponents = DateComponents (
    year: 2024,
    month: 7,
    day: 26,
    hour: 20,
    minute: 00
)

var boxe0 = Event(sport: boxing, epreuve: "Qualifications Poids-lourd", lieu: "Paris", awards: "", paralympique: false, dateEvent: userCalendar.date(from: DateComponents(year: 2024, month: 7, day: 28, hour: 10, minute: 30))!)
var climbing0 = Event(sport: climbing, epreuve: "Finale Vitesse", lieu: "Marseille", awards: "", paralympique: false, dateEvent: userCalendar.date(from: climbing0Components)!)
var handball0 = Event(sport: handball, epreuve: "Demi-finale", lieu: "Lille", awards: "", paralympique: true, dateEvent: userCalendar.date(from: handball0Components)!)


var events : [Event] = [boxe0, climbing0, handball0, tennis0]

/* --------  Tuto  --------
 
 // Tuto à étudier : http://swift-tuto.fr/524/les-dates-en-swift/
 
 */
