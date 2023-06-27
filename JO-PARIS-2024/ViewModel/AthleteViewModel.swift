//
//  AthleteViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import Foundation

class AthleteViewModel: ObservableObject {

    @Published var athletes: [Athlete] = [lorenzoMusetti] //  tableau formé à partir de la struct Athlete
}
