//
//  AthleteProfilView.swift
//  JO-PARIS-2024
//
//  Created by M on 22/06/2023.
//

import SwiftUI

// by Clara

struct AthleteProfilView: View {
    var image: String
    var nameAthlete:String
    var body: some View {
        VStack{
            Image("LorenzoMusetti")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width:100,height:100)
            Text("Lorenzo Musetti")
        }// fin premier Athlète
        .padding(30)
    }
}

struct AthleteProfilView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteProfilView(image: "LorenzoMusetti", nameAthlete: "Lorenzo Musetti")
    }
}
