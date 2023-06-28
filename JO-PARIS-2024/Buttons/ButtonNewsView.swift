//
//  ButtonNewsView.swift
//  JO-PARIS-2024
//
//  Created by M on 28/06/2023.
//

import SwiftUI

        struct ButtonNewsView: View {
             var imageFavori:String
             var textFavori:String
            var body: some View {
                
                
                    
                  
                        ZStack{
                            Image(imageFavori)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 342, height: 234)
        //                        .clipped()
                                .cornerRadius(26)
                            VStack {
                                Spacer()
                                
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
                            }
                            Text(textFavori)
                                .font(Font.custom("Paris2024-Variable", size: 17))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .offset(x: -70,y: 80)
                                
                            
                            
                        } // fin Zstack
                        
                     // fin label
                    
                        
            }
        }



struct ButtonNewsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNewsView(imageFavori: "gignac", textFavori: "blablabla")
    }
}

