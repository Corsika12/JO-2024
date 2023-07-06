//
//  AddAthleteView.swift
//  JO-PARIS-2024
//
//  Created by Clara on 27/06/2023.


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
                        
                        Task{
                            
                            let user = userVM.users[0]
                            
                            userVM.addAthlete (addAthlete: athlete)
                            
                            await userVM.updateUser()
                            
                            addingStuff += 1
                            
                            print(userVM.users[0].favoriteAthlete)
                            
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            AsyncImage(url: URL(string: athlete.photoAthlete) ){
                                image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 80, height: 80)
                                //                                        .padding()
                            } placeholder: {
                                Text("chargement photo d'Athlete")
                            }
                            Text(athlete.nameAthlete)
                        }
                    }
                    .tint(Color("Zeus")) // Color list
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
