//
//  ButtonNewsView.swift
//  JO-PARIS-2024
//
//  Created by Rémy on 28/06/2023.
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
                    .frame(width: 342, height: 80)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .black.opacity(0), location: 0.00),
                                Gradient.Stop(color: .black, location: 1.00),],
                            startPoint: UnitPoint(x: 0.5, y: -0.2),
                            endPoint: UnitPoint(x: 0.5, y: 1)))
                    .cornerRadius(26)
                    .offset(y: 80)
                
                //                    Spacer()
                Text(textFavori)
                    .frame(width: 300, height: 50)
                    .font(Font.custom("Paris2024-Variable", size: 20))
                    .bold()
                // Alignement du texte à gauche avec (.leading)
                    .multilineTextAlignment(.center)
//                    .padding(.leading, -16)
                    .foregroundColor(.white)
                    .offset(y: 80)
                    
                
            }
        }
    } // fin Zstack
}


struct ButtonNewsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNewsView(SportImage: "https://medias.paris2024.org/uploads/2021/06/Paris2024-CDM-JUDO-OLY-FINAL-6000px-scaled.jpg", textFavori: "blablabla")
            .environmentObject(UserViewModel())
            .environmentObject(CountryViewModel())
            .environmentObject(AthleteViewModel())
            .environmentObject(SportViewModel())
    }
}
