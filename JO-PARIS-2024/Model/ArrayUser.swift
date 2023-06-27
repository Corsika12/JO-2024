//
//  ArrayUsers.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation

// Structure des utilisateurs, avec les mots de passe

class User: Identifiable, ObservableObject {
    internal init(id: UUID = UUID(), userFirstName: String, userLastName: String, userImage: String, userEmail: String, userPassword: String, favoriteAthlete: [Athlete] = [], favoriteCountry: [Country] = [], favoriteSport: [Sport] = []) {
        self.id = id
        self.userFirstName = userFirstName
        self.userLastName = userLastName
        self.userImage = userImage
        self.userEmail = userEmail
        self.userPassword = userPassword
        self.favoriteAthlete = favoriteAthlete
        self.favoriteCountry = favoriteCountry
        self.favoriteSport = favoriteSport
    }
    
    var id: UUID = UUID()
    var userFirstName: String
    var userLastName: String
    var userImage: String
    
    var userEmail : String
    var userPassword: String
    
    @Published var favoriteAthlete: [Athlete] = [] // reprise des énumérations
    @Published var favoriteCountry: [Country] = []  // reprise des énumérations des 190 pays ?
    @Published var favoriteSport: [Sport] = []  // reprise des énumérations des 46 sports
    
}


// var favoriteSports : [Sport] = []

/* --------  To Do  --------
 
 Gestion des favoris
 
 */
