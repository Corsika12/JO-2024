//
//  CountryProfilView.swift
//  JO-PARIS-2024
//
//  Created by M on 22/06/2023.
//

import SwiftUI

// by Clara

struct CountryProfilView: View {
    var flagCountry: String
    var country:String
    var body: some View {

            VStack{
                Image(flagCountry)
                    .resizable()
                    .scaledToFill()
                    .frame(width:100,height:100)
                Text(country)
            }// fin premier pays
            .padding(20)
    }
}

struct CountryProfilView_Previews: PreviewProvider {
    static var previews: some View {
        CountryProfilView(flagCountry: italy.flagCountry, country: italy.country)
    }
}
