//
//  ButtonNewsView.swift
//  JO-PARIS-2024
//
//  Created by Rémi on 28/06/2023.
//


import SwiftUI

struct ButtonNewsView: View {
    var SportImage:String
    var textFavori:String
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var sportVM: SportViewModel
    var body: some View {
        
        
        ZStack {
            //            VStack {
            ZStack{
                
                AsyncImage(url: URL(string: SportImage) ){
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 342, height: 234)
                    //                        .clipped()
                        .cornerRadius(26)
                    //                    .scaledToFill()
                } placeholder: {
                    
                } // image du profil
                
                
            }
            
            
            //                if !userVM.users.isEmpty{
            
            
            ZStack{
                
                //                    Spacer()
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 342, height: 54)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .black.opacity(0), location: 0.00),
                                Gradient.Stop(color: .black, location: 1.00),],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)))
                    .cornerRadius(26)
                
                //                    Spacer()
                Text(textFavori)
                    .font(Font.custom("Paris2024-Variable", size: 27))
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .offset(x: -70,y: 80)
                
            }
        }
    } // fin Zstack
    
    // fin label
    
    
}

//    }


struct ButtonNewsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNewsView(SportImage: "https://medias.paris2024.org/uploads/2021/06/Paris2024-CDM-JUDO-OLY-FINAL-6000px-scaled.jpg", textFavori: "blablabla")
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(AthleteViewModel())
            .environmentObject(SportViewModel())
    }
}

//}

/*
 struct ButtonNewsView_Previews: PreviewProvider {
 static var previews: some View {
 ButtonNewsView(imageFavori: "gignac", textFavori: "blablabla")
 }
 }
 */
