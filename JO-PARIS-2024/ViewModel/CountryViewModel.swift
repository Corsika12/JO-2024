//
//  CountryViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import Foundation

class CountryViewModel: ObservableObject {

    @Published var countries: [Country] = [italy, southAfrica, japan, brazil, newZeland] //  tableau formé à partir de la struct Country
}
