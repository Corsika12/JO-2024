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
        
        ScrollView {
            VStack {
            Text("Favoris")
                
                .font(Font.custom("Paris2024-Variable", size: 24))
                .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                .padding(.horizontal, 15)
//                .frame(width: 388, alignment: .topLeading)
                
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    
                    ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")
                    ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")
                    ButtonNewsView(imageFavori: "gignac", textFavori: "Football: FRA 3-2 JAP")

                    
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
                    
                    ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première")
                    ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première")
                    ButtonNewsView(imageFavori: "surfer", textFavori: "Surf: Une première")

                    
                }  //Vstack Aujourd'hui
                .padding(.horizontal, 20)
                .padding(.vertical, 0)
                
            } //Grande Vstack
            
            
        } //ScrollView Verticale
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

struct ButtonNewsView: View {
     var imageFavori:String
     var textFavori:String
    var body: some View {
        ZStack {
            
            Button {
                //                            Acces à l'info
            } label: {
                ZStack{
                    Image(imageFavori)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 342, height: 234)
//                        .clipped()
                        .cornerRadius(26)
                    Text(textFavori)
                        .font(Font.custom("Paris2024-Variable", size: 17))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .offset(x: -70,y: 80)
                        
                        
                }
                
            }
            
            
            
            
            //                        Rectangle()
            //
            //                        .foregroundColor(.clear)
            //                        .frame(width: 342, height: 54)
            //                        .background(
            //                        LinearGradient(
            //                        stops: [
            //                        Gradient.Stop(color: .black.opacity(0), location: 0.00),
            //                        Gradient.Stop(color: .black, location: 1.00),
            //                        ],
            //                        startPoint: UnitPoint(x: 0.5, y: 0),
            //                        endPoint: UnitPoint(x: 0.5, y: 1)
            //                        )
            //                        )
            //                        .cornerRadius(26)
        }//Fin Zstack
    }
}

