//
//  ArraySports.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.


import Foundation



// Structure des sports



struct Sport: Identifiable, Codable {

    var id: String = ""

    var sport: String // Enumérations des 54 sports

    var iconSport: String

    var SportImage: String
    
    var SportArticle: String

    

    enum CodingKeys: String, CodingKey {

        case sport

        case iconSport

        case SportImage
        
        case SportArticle

    } // Logo du sport

}





let athetisme = Sport(sport: "Athlétisme", iconSport: "", SportImage: "", SportArticle: "")



/*

Aviron

Badminton

Basketball

Basketball 3x3

BMX freestyle

BMX race

*/

 

let boxing = Sport(sport: "Boxe", iconSport: "figure.boxing", SportImage: "", SportArticle: "")



/*

Breaking

Canoë slalom

Canoë sprint

Cyclisme sur piste

Cyclisme sur route

*/

 

let climbing = Sport(sport: "Escalade sportive", iconSport: "figure.climbing", SportImage: "", SportArticle: "")



let escrime = Sport(sport: "Escrime", iconSport: "figure.fencing", SportImage: "", SportArticle: "")

// Escrime fauteuil

// Football



let golf = Sport(sport: "Golf", iconSport: "figure.golf", SportImage: "", SportArticle: "")

//Gymnastique artistique

//Gymnastique rythmique

//Haltérophilie

let handball = Sport(sport: "Handball", iconSport: "figure.handball", SportImage: "", SportArticle: "")

//Hockey

let judo = Sport(sport: "Judo", iconSport: "", SportImage: "", SportArticle: "")

//Lutte

//Natation

//Natation artistique

//Natation marathon

//Pentathlon moderne

//Plongeon

//Rugby

//Skateboard

//Sports Equestres

//Surf

//Taekwondo



let tennis = Sport(sport: "Tennis", iconSport: "tennis.racket", SportImage: "", SportArticle: "")

//Tennis de table

//Tir

let archery = Sport(sport: "Tir à l'arc", iconSport: "figure.archery", SportImage: "", SportArticle: "")



//Trampoline

//Triathlon

//Voile

//Volleyball

//Volleyball de plage

//VTT

//Waterpolo




/* --------  To Do  --------
 
 Infos sur Airtable, constantes à supprimer ?
 
 */
