//
//  UserViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = [User (
        userFirstName: "Miles",
        userLastName: "Morales",
        userImage: "userImage",
        userEmail: "milesmorales@gmail.com",
        userPassword: "milesmorales",
        favoriteAthlete:[lorenzoMusetti],
        favoriteCountry:[italy, brazil],
        favoriteSport:[tennis])] // user formé à partir de la struct User
    
    func addCountry(currentUser: User, addCountry: Country){
        currentUser.favoriteCountry.append(addCountry)
    }
    
    func addSport(currentUser: User, addSport: Sport){
        currentUser.favoriteSport.append(addSport)
    }
    
    func addAthlete(currentUser: User, addAthlete: Athlete){
        currentUser.favoriteAthlete.append(addAthlete)
    }
    
    
}
