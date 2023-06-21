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
    var sport: String // Discipline
    var paralympique: Bool // Identifications des événements paralympiques
    var dateEvent: Date // Date de la compétition
    var hourEvent: Date?  // à voir si besoin d'une énumération ou un autre modèle de date ?
    // Voir pour les scores, podiums... ?
    
    
    // Tuto à étudier : http://swift-tuto.fr/524/les-dates-en-swift/
}
