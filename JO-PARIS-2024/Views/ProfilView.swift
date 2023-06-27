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
    
    @AppStorage("addingStuff") var addingStuff : Int = 0
    @State var isShown : Bool = false
    @EnvironmentObject var countryVM: CountryViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationView() {
            ScrollView {
                VStack{
                    
                    HStack{
                        Image(userVM.users[0].userImage) // image du profil
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                        
                        VStack(alignment:.leading){
                            Text(userVM.users[0].userFirstName)// prénom et nom de l'utilisateur
                                .font(.title2)
                                .bold()
                            Text(userVM.users[0].userLastName)
                                .foregroundColor(.gray)
                        }
                        .padding(70)
                        
                        Button {
                            isShown.toggle()
                        } label: {
                            Image(systemName:"gearshape")
                        }
                        .tint(.black)// bouton réglages
                        .sheet(isPresented: $isShown) {
                            SettingsView(isModaleShown: $isShown)
                        }
                    } // fin de l'entête du profil
                    
                    
                    Text("Pays")//titre cathégorie
                        .font(.title3)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack{
                            
                            ForEach (userVM.users[0].favoriteCountry) {
                                country in
                                CountryProfilView(flagCountry: country.flagCountry, country: country.country)
                            }// pays
                            
                            NavigationLink {
                                AddCountryView()
                            } label: {
                                AddView()
                            }
                            
                        }
                        
                    }//fin scrollView pays
                    
                    Text("Sports")//titre cathégorie
                        .font(.title3)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack{
                            
                            ForEach(userVM.users[0].favoriteSport){
                                sport in
                                SportProfilView(image: sport.iconSport, nameSport: sport.sport)
                            }
                            //premier sport
                            
                            NavigationLink {
                                AddSportView()
                            } label: {
                                AddView()
                            }
                        }
                    }//fin ScrollView sport
                    
                    
                    Text("Athlètes")//titre cathégorie
                        .font(.title3)
                        .bold()
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(userVM.users[0].favoriteAthlete){
                                athlete in
                                AthleteProfilView(image:athlete.photoAthlete, nameAthlete: athlete.nameAthlete )
                            }
                            
                            NavigationLink {
                                AddAthleteView()
                            } label: {
                                AddView()
                            }
                        }
                    }//fin ScrollView athlete
                }
            }
        }
        .onChange(of: addingStuff) { newValue in
            userVM.objectWillChange.send()
            
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(AthleteViewModel())
            .environmentObject(SportViewModel())
    }
}

