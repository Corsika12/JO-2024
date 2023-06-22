//
//  ArrayUsers.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation

// Structure des utilisateurs, avec les mots de passe

struct User: Identifiable {
    var id: UUID = UUID()
    var userName: String?
    var userImage: String?

    var userEmail : String?
    var userPassword: String?
    
    var favoriteAthlete: [Athlete] = [] // reprise des énumérations
    var favoriteCountry: [Country] = []  // reprise des énumérations des 190 pays ?
    var favoriteSport: [Sport] = []  // reprise des énumérations des 46 sports
    
}


// var favoriteSports : [Sport] = []

/* --------  To Do  --------
 
 Gestion des favoris
 
 */
