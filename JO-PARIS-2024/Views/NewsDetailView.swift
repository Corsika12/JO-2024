//
//  NewsDetailView.swift
//  JO-PARIS-2024
//
//  Created by Remy on 28/06/2023.
//

import SwiftUI

struct NewsDetailView: View {
    var SportImage:String
    var SportArticle: String
    var TitleSport:String
    var textFavori:String
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var sportVM: SportViewModel
    var body: some View {
        
        
        ZStack {
            
            AsyncImage(url: URL(string: SportImage) ){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 342, height: 234)
                    .clipped()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                
            } placeholder: {
                
            }
            Spacer()
            
            
            
            ZStack {
                
                    Color("Grey")
                        .opacity(0.93)
//                        .frame(width: 395)
                        .edgesIgnoringSafeArea(.top)
                        .edgesIgnoringSafeArea(.bottom)
                
                        ScrollView {
                        VStack{
                            Text(TitleSport)
                                .frame(width: 370)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding()
                            
                            Text(SportArticle)
                                .frame(width: 370)
                                .font(.title2)
                                .foregroundColor(.black)

                            
                            
                        }
                    
                }
            }
            
            
        }
        
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(SportImage: "https://pbs.twimg.com/media/FY03MXyXkAI7lOo.jpg:large", SportArticle: "Aujourd'hui la castagne... blablablablablballlll", TitleSport: "La bagare", textFavori: "Popatoes")
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(AthleteViewModel())
            .environmentObject(SportViewModel())
    }
}
