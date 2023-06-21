//
//  ArrayUsers.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation

// Structure des utilisateurs, avec les mots de passe

struct Users: Identifiable {
    var id: UUID = UUID()
    var userName: String
    var userImage: String

    var userEmail : String
    var userPassword: String
}



