//
//  SettingsView.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isModaleShown : Bool
    
    var body: some View {
        
        LazyVStack{
            Section{
                Text("Paramétrages")
                    .font(.title)
                Text("Ajouter un toggle pour le choix utilisateur sur les notifications ? La géolocalisation ? ... ")
            }
            .padding()
            Divider()
            Section{
                Text("A propos")
                    .font(.title)
                Text("Politique de confidentialité")
                    .font(.title3)
                Text("Aucune donnée n'est utilisée à titre commercial par l'application, ni par des applications tierces, ni par quelque organisme que ce soit.")
                Text("Toutes les données enregistrées sur le téléphone (prénoms, aides, lieux) sont effacées lors de la désinstallation de l'application. Toutes les données enregistrées par l'application sur votre compte iCloud sont effacées lorsque vous supprimez l'ensemble de données.")
            }
            .padding()
            Section{
                Text("Contrat de licence utilisateur final")
                    .font(.title3)
                Text("Retrouvez toutes ces informations sur notre site www.olympixo.com")
            }
            .padding()
        }
        
        Button {
            isModaleShown = false
        } label: {
            Image(systemName: "xmark")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isModaleShown: .constant(true))
    }
}
