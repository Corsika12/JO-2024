//
//  EventsView.swift
//  JO-PARIS-2024
//
//  Created by Seraphin on 21/06/2023.
//

import SwiftUI

// --------  Ecran des évènements avec calendrier (Date Picker)  --------
// by Séraphin

struct EventsView: View {
    
    @StateObject var vm : EventVM = EventVM(sport: false, date: false)
    
    var body: some View {
        VStack {
            HStack{
                Text("Évenements")
                    .font(.custom("Paris2024", size: 24))
                    .foregroundColor(Color("RougeAmour"))
                    .padding()
                    
                Spacer()
            }
            
            ButtonEvent(txt: "Dates", isPresented: $vm.date)
            
            ButtonEvent(txt: "Sport", isPresented: $vm.sport)
            
            if vm.sport {
                           SportListView()
                       } else {
                           EventListView()
                       }
            
            Spacer()
            
            MapSportsView()
        }
    }
}




struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
            .environmentObject(SportViewModel())
    }
}

struct SportListView: View {
    
    @EnvironmentObject var sportVM: SportViewModel
    
    var body: some View {
        List{
            ForEach(sportVM.sports) { sport in
                HStack {
                    Image(systemName: sport.iconSport)
                    Text(sport.sport)
                }
            }.listRowBackground(Color("Pearl Bush"))
        }.scrollContentBackground(.hidden)
    }
}

struct ButtonEvent : View {
    
    var txt: String
    @Binding var isPresented: Bool
    
    var color: Color = .blue
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text(txt)
        })
        .buttonStyle(.borderedProminent)
    }
}
