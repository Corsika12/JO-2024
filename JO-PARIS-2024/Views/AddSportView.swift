//
//  AddSportView.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import SwiftUI

struct AddSportView: View {
    
    @AppStorage("addingStuff") var addingStuff : Int = 0
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var sportVM: SportViewModel
    
    var body: some View {
        VStack{
            List{
                ForEach(sportVM.sports){
                    sport in
                    
                    Button {
                        userVM.addSport (currentUser: userVM.users[0], addSport: sport)
                        addingStuff += 1
                        print(userVM.users[0].favoriteSport)
                    } label: {
                        HStack {
                            Image(sport.iconSport)
                                .resizable()
                                .scaledToFill()
                                .frame(width:80,height:80)
                            Text(sport.sport)
                        }
                    }
                }
            }
        }
    }
}

struct AddSportView_Previews: PreviewProvider {
    static var previews: some View {
        AddSportView()
            .environmentObject(SportViewModel())
            .environmentObject(UserViewModel())
    }
}
