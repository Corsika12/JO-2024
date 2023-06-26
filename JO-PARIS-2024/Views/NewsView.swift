//
//  NewsView.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import SwiftUI

// --------  Ecran des actualités  --------
// by Rémy

struct NewsView: View {
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
                                ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")
                            }
                            NavigationLink {
                                NewsDetailView()
                            } label: {
                                ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")
                            }
                            NavigationLink {
                                NewsDetailView()
                            } label: {
                                ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")
                            }
                            
                            
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
                            
                            NavigationLink {
                                NewsDetailView()
                            } label: {
                                ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première aux JO")
                            }
                            NavigationLink {
                                NewsDetailView()
                            } label: {
                                ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première aux JO")
                            }
                            NavigationLink {
                                NewsDetailView()
                            } label: {
                                ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première aux JO")
                            }
                            
                            
                        }  //Vstack Aujourd'hui
                        .padding(.horizontal, 20)
                        .padding(.vertical, 0)
                        
                    } //Grande Vstack
                    
                    
                } //ScrollView Verticale
            }
        }
        
    }


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
