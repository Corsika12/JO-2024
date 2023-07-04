//
//  NewsView.swift
//  JO-PARIS-2024
//
//  Created by Rémy on 21/06/2023.
//

import SwiftUI

// --------  Ecran des actualités  --------

struct NewsView: View {
    //        @StateObject private var viewModel = NewsViewModel()
    
    @EnvironmentObject var countryVM: CountryViewModel
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var sportVM: SportViewModel
    @EnvironmentObject var athleteVM: AthleteViewModel
    
    
    //        var filteredSports: [User] {
    //            switch filter {
    //            case .none:
    //                return $userVM.favSport
    //            case .contacted:
    //                return prospects.people.filter { $0.isContacted }
    //            case .uncontacted:
    //                return prospects.people.filter { !$0.isContacted }
    //            }
    //        }
    var body: some View {
        
        NavigationStack{
            
            ScrollView {
                VStack {
                    Text("Favoris")
                    
                        .font(Font.custom("Paris2024-Variable", size: 24))
                        .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                        .padding(.horizontal, 15)
                    //                .frame(width: 388, alignment: .topLeading)
                    
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            
                            NavigationLink {
                                NewsDetailView()
                            } label: {
                                ForEach (sportVM.sports) {
                                    sport in
                                    ButtonNewsView(SportImage: sport.SportImage, textFavori: sport.SportArticle)
                                }
                            }
                            //                            NavigationLink {
                            //                                NewsDetailView()
                            //                            } label: {
                            //                                ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")
                            //                            }
                            //                            NavigationLink {
                            //                                NewsDetailView()
                            //                            } label: {
                            //                                ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")
                            //                            }
                            
                            
                        }//Hstack
                        .padding()
                        
                    } //ScrollView Horizontale
                    
                    
                    VStack(spacing: 15)  {
                        Text("Aujourd’hui")
                            .font(Font.custom("Paris2024-Variable", size: 24))
                            .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                    }
                    .padding([.leading, .bottom, .trailing], 15)
                    //            .frame(width: 388, alignment: .topLeading)
                    
                    
                    VStack(spacing: 20) {
                        ForEach (sportVM.sports) {
                            sport in
                            ButtonNewsView(SportImage: sport.SportImage, textFavori: sport.SportArticle)
                        }
                    }
                    .padding()
                    
                    //                        VStack(spacing: 20) {
                    //
                    //                            NavigationLink {
                    //                                NewsDetailView()
                    //                            } label: {
                    //                                ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première aux JO")
                    //                            }
                    //                            NavigationLink {
                    //                                NewsDetailView()
                    //                            } label: {
                    //                                ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première aux JO")
                    //                            }
                    //                            NavigationLink {
                    //                                NewsDetailView()
                    //                            } label: {
                    //                                ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première aux JO")
                    //                            }
                    //
                    //
                    //                        }  //Vstack Aujourd'hui
                    //                        .padding(.horizontal, 20)
                    //                        .padding(.vertical, 0)
                    //
                } //Grande Vstack
                
                
            } //ScrollView Verticale
        }.onAppear{
            
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
    
}



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
