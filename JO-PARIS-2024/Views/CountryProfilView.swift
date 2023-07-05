//
//  CountryProfilView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 22/06/2023.
//

import SwiftUI

struct CountryProfilView: View {
    var flagCountry: String
    var country:String
    var body: some View {

        VStack(){

                Image("\(flagCountry)")
                    .resizable()
                    .scaledToFill()
                    .frame(width:150,height:150)
                Text(country)
            }// fin premier pays
        .padding(.leading, 24)
    }
}

struct CountryProfilView_Previews: PreviewProvider {
    static var previews: some View {
        CountryProfilView(flagCountry: italy.flagCountry, country: italy.country)
    }
}
