//
//  ProfilView.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//


import SwiftUI

// --------  Ecran de profil de l'utilisateur  --------
// by Clara

struct ProfilView: View {
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Image("userImage") // image du profil
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                    
                    VStack(alignment:.leading){
                        Text("Miles")// prénom et nom de l'utilisateur
                            .font(.title2)
                            .bold()
                        Text("Morales")
                            .foregroundColor(.gray)
                    }
                    .padding(70)
                    
                    Button {
                        //
                    } label: {
                        Image(systemName:"gearshape")
                    }
                    .tint(.black)// bouton réglages
                                            
                } // fin de l'entête du profil
                
                
                
                
                

                    Text("Pays")//titre cathégorie
                        .font(.title3)
                        .bold()
                ScrollView(.horizontal) {
                    HStack{
                            CountryProfilView(flagCountry: italy.flagCountry, country: italy.country)//premier pays
                            
                            CountryProfilView(flagCountry: brazil.flagCountry, country: brazil.country)// deuxième pays
                            
                            Button {
                                //
                            } label: {
                                AddView()// ajout athlète
                            }
                            
                    }//fin HStack pays
                }
                    

                

                    Text("Sports")//titre cathégorie
                        .font(.title3)
                        .bold()
                ScrollView(.horizontal) {
                    HStack{
                            SportProfilView(image: tennis.iconSport, nameSport: tennis.sport)//premier sport
                            
                            Button {
                                //
                            } label: {
                                AddView()// ajout athlète
                            }
                    }//fin HStack sport
                }
                    

                    Text("Athlètes")//titre cathégorie
                        .font(.title3)
                        .bold()
                ScrollView(.horizontal) {
                    HStack{
                            AthleteProfilView(image: "LorenzoMusetti", nameAthlete: "Lorenzo Musetti")
                            
                            Button {
                                //
                            } label: {
                                AddView()// ajout athlète
                            }
                    }//fin HStack athlete
                }
                
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
