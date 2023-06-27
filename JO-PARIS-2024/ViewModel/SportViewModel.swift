//
//  SportViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import Foundation

class SportViewModel: ObservableObject {

    @Published var sports : [Sport] = [athetisme, climbing, boxing, archery, escrime, golf, handball] //  tableau formé à partir de la struct Sport
}
