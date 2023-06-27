//
//  AddAthleteView.swift
//  JO-PARIS-2024
//
//  Created by M on 27/06/2023.
//

import SwiftUI

struct AddAthleteView: View {
    
    @AppStorage("addingStuff") var addingStuff : Int = 0
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var athleteVM: AthleteViewModel
    
    var body: some View {
        VStack{
            List{
                ForEach(athleteVM.athletes){
                    athlete in
                    
                    Button {
                        userVM.addAthlete (currentUser: userVM.users[0], addAthlete: athlete)
                        addingStuff += 1
                        print(userVM.users[0].favoriteAthlete)
                    } label: {
                        HStack {
                            Image(athlete.photoAthlete)
                                .resizable()
                                .scaledToFill()
                                .frame(width:80,height:80)
                                .clipped()
                            Text(athlete.nameAthlete)
                        }
                    }
                }
            }
        }
    }
}

struct AddAthleteView_Previews: PreviewProvider {
    static var previews: some View {
        AddAthleteView()
            .environmentObject(AthleteViewModel())
            .environmentObject(UserViewModel())

    }
}
