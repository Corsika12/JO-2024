//
//  AddSportView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.


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

                        Task{

                            let user = userVM.users[0]

                             userVM.addSport (addSport: sport)

                            await userVM.updateUser()

                            addingStuff += 1

                            print(userVM.users[0].favoriteSport)}

                    } label: {

                        HStack {

                            Image(sport.iconSport)

                                .resizable()

                                .scaledToFill()

                                .frame(width:80,height:80)

                            Text(sport.sport)

                        }

                    }
                    .tint(Color("Zeus")) // Color list
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
