//
//  AddView.swift
//  JO-PARIS-2024
//
//  Created by M on 22/06/2023.
//

import SwiftUI

struct AddView: View {
    var body: some View {
            VStack{
                Image(systemName:"plus.circle")
                    .resizable()
                    .frame(width:50,height:50)

                Text("Ajouter")
                    // .font(Font.custom("Paris2024-Variable", size: 24))
            }// Ajouter
            .padding(30)
            .foregroundColor(.gray)
        }
    }

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
