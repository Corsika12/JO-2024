//
//  ArrayFavorites.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation


// Structure des favoris

struct Favorites: Identifiable {
    var id: UUID = UUID()
    var favoriteAthlete: String? // reprise des énumérations
    var favoriteCountry: String? // reprise des énumérations des 208 pays ?
    var favoriteSport: String? // reprise des énumérations des 54 sports ?
}

/* ---------  QUESTIONS  ---------
 
 Jointures entre les tables -> à étudier
 https://stackoverflow.com/questions/63783915/how-to-join-two-core-data-tables
 
 Comment laisser la possibilité à l’utilisateur de choisir plusieurs athlètes, sports, pays

 Mettre en lien les tableaux country/athlète/sport avec le tableau favoris —> optionnel comment ça fonctionne
 
 */
