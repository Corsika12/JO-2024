//
//  ArraySports.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import Foundation

// Structure des sports

struct Sport: Identifiable {
    var id: UUID = UUID()
    var sport: String // Enumérations des 54 sports ?
    var iconSport: String // Logo du sport
}




let athetisme = Sport(name: "Athlétisme", iconSport: "")

/*
Aviron
Badminton
Basketball
Basketball 3x3
BMX freestyle
BMX race
*/
 
let Boxe = Sport(sport: "Boxe", iconSport: "figure.boxing")

/*
Breaking
Canoë slalom
Canoë sprint
Cyclisme sur piste
Cyclisme sur route
*/
 
let climbing = Sport(sport: "Escalade sportive", iconSport: "figure.climbing")

let escrime = Sport(sport: "Escrime", iconSport: "figure.fencing")
// Escrime fauteuil
// Football

let golf = Sport(sport: "Golf", iconSport: "figure.golf")
Gymnastique artistique
Gymnastique rythmique
Haltérophilie
let handball = Sport(sport: "Handball", iconSport: "figure.handball")
Hockey
Judo
Lutte
Natation
Natation artistique
Natation marathon
Pentathlon moderne
Plongeon
Rugby
Skateboard
Sports Equestres
Surf
Taekwondo
Tennis
Tennis de table
Tir
let archery = Sport(sport: "Tir à l'arc", iconSport: "figure.archery")
Trampoline
Triathlon
Voile
Volleyball
Volleyball de plage
VTT
Waterpolo


let sports : [Sport] = [climbing, boxing, archery, escrime, golf, handball]

var favoriteSports : [Sport] = []




/* --------  To Do  --------
 
 Possibilité de convertir Excel en JSON
 
 */
