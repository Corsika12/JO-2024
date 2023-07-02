//
//  SportDetailView.swift
//  JO-PARIS-2024
//
//  Created by M on 02/07/2023.
//

import SwiftUI

struct SportDetailView: View {
    var sport: SportsDataModel
    
    var body: some View {
        VStack {
            Text(sport.sports ?? "")
                .font(.largeTitle)
                .padding()
            
            Text(sport.detailSport ?? "")
                .font(.body)
                .padding()
            Text("Suivez ces épreuves qui se déroulent à \(sport.localisation ?? "") du \(sport.startDate ?? "") jusqu'au \(sport.endDate ?? ""). \(sport.awards ?? "")")
        }
    }
}

/*
 struct SportDetailView_Previews: PreviewProvider {
 static var previews: some View {
     SportDetailView()
 }
 }
 */
