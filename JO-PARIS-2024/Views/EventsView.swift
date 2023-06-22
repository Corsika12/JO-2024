//
//  EventsView.swift
//  JO-PARIS-2024
//
//  Created by M on 21/06/2023.
//

import SwiftUI

// --------  Ecran des évènements avec calendrier (Date Picker)  --------
// by Séraphin

struct EventsView: View {
    
    @State var sport: Bool
    @State var date: Bool
    
    var body: some View {
        VStack {
            HStack{
                Text("Évenements")
                    .font(.custom("Paris2024", size: 24))
                    .foregroundColor(Color("RougeAmour"))
                    .padding()
                    
                Spacer()
            }
            
            ButtonEvent(txt: "Dates", isPresented: $date)
            
            ButtonEvent(txt: "Sport", isPresented: $sport)
            
            if sport {
                SportListView()
            }
            
            Spacer()
        }
        
        
    }
}




struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(sport: true, date: false)
    }
}

struct SportListView: View {
    var body: some View {
        List{
            ForEach(sports) { sport in
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
