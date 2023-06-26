//
//  EventViewModel.swift
//  JO-PARIS-2024
//
//  Created by Seraphin on 26/06/2023.
//

import Foundation

class EventVM : ObservableObject {

    internal init(sport: Bool, date: Bool) {
        self.sport = sport
        self.date = date
    }

    @Published var sport: Bool // sert à afficher le filtre des sports
    @Published var date: Bool // sert à afficher le filtre des dates (calendrier)


//    Voir la fonction pour afficher les views ??
//    func showFiltre() {
//        if sport {
//            SportListView()
//        } else {
//            EventListView()
//        }
//    }
}
