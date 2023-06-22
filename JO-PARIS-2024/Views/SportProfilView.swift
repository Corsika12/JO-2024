//
//  SportProfilView.swift
//  JO-PARIS-2024
//
//  Created by M on 22/06/2023.
//

import SwiftUI

// by Clara

struct SportProfilView: View {
    var image: String
    var nameSport: String
    var body: some View {
        VStack{
            Image(systemName: image)
                .resizable()
                .scaledToFill()
                .frame(width:80,height:80)
            Text(nameSport)
        }
        .padding(30)
    }
}

struct SportProfilView_Previews: PreviewProvider {
    static var previews: some View {
        SportProfilView(image: tennis.iconSport, nameSport: tennis.sport)
    }
}
