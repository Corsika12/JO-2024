////
//  AddCountryView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.


import SwiftUI


struct AddCountryView: View {

    

    @AppStorage("addingStuff") var addingStuff : Int = 0

    @EnvironmentObject var userVM: UserViewModel

    @EnvironmentObject var countryVM: CountryViewModel

    

    var body: some View {

        VStack{

            List{

                ForEach(countryVM.countries){

                    country in

                    

                    Button {

                        print("add Coutry : \(country.id)")

                        Task {

                            let user = userVM.users[0]

                            userVM.addCountry (addCountry: country)

                            await userVM.updateUser()

                            addingStuff += 1

                            print(userVM.users[0].favoriteCountry)}

                    } label: {

                        HStack {

                            Image(country.flagCountry)

                                .resizable()

                                .scaledToFill()

                                .frame(width:80,height:80)

                            Text(country.country)

                        }

                    }

                    

//                                        HStack {

//                                            Image(country.flagCountry)

//                                                .resizable()

//                                                .scaledToFill()

//                                            .frame(width:80,height:80)

//                                            Text(country.country)

//                                        }

//                                        .onTapGesture {

//                                            userVM.addCountry(currentUser: userVM.users[0], addCountry: country)

//                                        }

                }

            }

        }

//        onAppear{

//            Task{

//                //                await sportVM.fetchSport()

//                //                await athleteVM.fetchAthlete()

//                await countryVM.fetchCountry()

//                await userVM.fetchUser()

//                userVM.getCountries(countryVM.countries)

//            }

//        }

    }

}



struct CountryListView_Previews: PreviewProvider {

    static var previews: some View {

        AddCountryView()

            .environmentObject(UserViewModel())

            .environmentObject(CountryViewModel())

    }

}
