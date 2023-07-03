//
//  ProfilView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 21/06/2023.
//

import SwiftUI

// --------  Ecran de profil de l'utilisateur  --------

struct ProfilView: View {

    

    @AppStorage("addingStuff") var addingStuff : Int = 0

    @State var isShown : Bool = false

    @EnvironmentObject var sportVM: SportViewModel

    @EnvironmentObject var athleteVM: AthleteViewModel

    @EnvironmentObject var countryVM: CountryViewModel

    @EnvironmentObject var userVM: UserViewModel

    

    var body: some View {

        NavigationView() {

            ScrollView {

                

                if !userVM.users.isEmpty{

                    

                    VStack(alignment: .leading, spacing: 0){

                        

                        ZStack {

                            Color("PearlBush")

                            HStack{

                                AsyncImage(url: URL(string: userVM.users[0].userImage) ){

                                    image in

                                    image

                                        .resizable()

                                        .scaledToFill()

                                        .clipShape(Circle())

                                        .frame(width: 80, height: 80)

                                        .padding()

                                } placeholder: {

                                    Text("chargement photo de profil")

                                } // image du profil

                                    

                                

                                VStack(alignment:.leading){

                                    Text(userVM.users[0].userFirstName)// prénom et nom de l'utilisateur

                                        .font(.title2)

                                        .bold()

                                    Text(userVM.users[0].userLastName)

                                        .foregroundColor(.gray)

                                }

                                .font(Font.custom("Paris2024-Variable", size: 20))

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

                            }

                        } // fin de l'entête du profil

                        

                        Divider()

                        

                        Text("Pays")//titre cathégorie

                            .font(.title3)

                            .bold()

                            .padding()

                        //                        .font(Font.custom("Paris2024-Variable", size: 24))

                        

                        ScrollView(.horizontal) {

                            HStack{

                                

                                ForEach (userVM.users[0].favCountry) {

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

                        

                        Divider()

                            .padding()

                        

                        Text("Sports")//titre cathégorie

                            .font(.title3)

                            .bold()

                            .padding()

                        //                        .font(Font.custom("Paris2024-Variable", size: 24))

                        

                        ScrollView(.horizontal) {

                            HStack{

                                

                                ForEach(userVM.users[0].favSport){

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

                        

                        Divider()

                            .padding()

                        

                        

                        Text("Athlètes")//titre cathégorie

                            .font(.title3)

                            .bold()

                            .padding()

                        //                        .font(Font.custom("Paris2024-Variable", size: 24))

                        ScrollView(.horizontal) {

                            HStack{

                                ForEach(userVM.users[0].favAthlete){

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

                }// fin grande VStack

                .onAppear{

                    Task{

                        await sportVM.fetchSport()

                        await athleteVM.fetchAthlete()

                        await countryVM.fetchCountry()

                        await userVM.fetchUser()

                        userVM.getCountries(countryVM.countries)

                        userVM.getSport(sportVM.sports)

                        userVM.getAthlete(athleteVM.athletes)

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
