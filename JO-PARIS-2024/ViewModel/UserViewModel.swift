//
//  UserViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    func fetchUser() async {
        let apikey = "keyYoFImG0TYBYfYx"
        if let url = URL(string: "https://api.airtable.com/v0/appRXuEqQRTEFLrki/tbl6Dqx2YJTZbgGlu") {
            do {
                var request = URLRequest(url: url)
                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
                
                let (data, _) = try await URLSession.shared.data(for: request)
                
                if let JSonData = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                    
                    if let records = JSonData ["records"] as? [[String:Any]]{
                        if let fields = records[0] ["fields"] as? [String:Any]{
                            let fav = fields ["favoriteCountry"] as? [String]
                            print(fav)
                        }
                    }
                    
                    print(JSonData)
                    
                }
                
                if let decodedResponse = try? JSONDecoder().decode(UserResponse.self, from: data) {
                    
                    users = decodedResponse.users
                    print("user succes----------------")
                    
                }
            } catch {
                print("Invalid data")
            }
        }
    }
    
    func getCountries(_ countries:[Country]){
        for  (index, user) in users.enumerated() {
            var favs: [Country] = []
            for c in user.favoriteCountry{
                let fav = countries.first { country in
                    country.id == c
                }
                if let fav{
                    favs.append(fav)
                }
            }
            users[index].favCountry = favs
        }
    }
    
    //    func getCountries(_ countries:[Country]){
    //        for  (index, user) in users.enumerated() {
    //            var favs: [Country] = []
    //            for c in user.favoriteCountry{
    //                let fav = countries.first { country in
    //                    country.id == c
    //                }
    //                if let fav{
    //                    favs.append(fav)
    //                }
    //            }
    //            users[index].favCountry = favs
    //        }
    //    }
    //
    //    func getCountries(_ countries:[Country]){
    //        for  (index, user) in users.enumerated() {
    //            var favs: [Country] = []
    //            for c in user.favoriteCountry{
    //                let fav = countries.first { country in
    //                    country.id == c
    //                }
    //                if let fav{
    //                    favs.append(fav)
    //                }
    //            }
    //            users[index].favCountry = favs
    //        }
    //    }
    
    //    [User (
    //        userFirstName: "Miles",
    //        userLastName: "Morales",
    //        userImage: "userImage",
    //        userEmail: "milesmorales@gmail.com",
    //        userPassword: "milesmorales",
    //        favoriteAthlete:[lorenzoMusetti],
    //        favoriteCountry:[italy, brazil],
    //        favoriteSport:[tennis])] // user formé à partir de la struct User
    
    func addCountry(currentUser: inout User, addCountry: Country){
        currentUser.favCountry.append(addCountry)
    }
    
    func addSport(currentUser: inout User, addSport: Sport){
        currentUser.favSport.append(addSport)
    }
    
    func addAthlete(currentUser: inout User, addAthlete: Athlete){
        currentUser.favAthlete.append(addAthlete)
    }
}







/*  Ancien code :
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
 */
