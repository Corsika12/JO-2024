//
//  EventsView.swift
//  JO-PARIS-2024
//
//  Created by Seraphin on 21/06/2023.
// --------  Ecran des évènements avec calendrier (Date Picker)  --------

import SwiftUI



struct EventsView: View {
    
    @EnvironmentObject var eventVM: EventViewModel
    //    @StateObject var vm : EventVM = EventVM(sport: false, date: false)
    
    var body: some View {
        VStack {
            
                Text("Évenements")
                    .font(.custom("Paris2024", size: 24))
                    .foregroundColor(Color("RougeAmour"))
                    .padding()
                
                
                MapSportsView()
                    .tint(Color("Apache"))
                    .padding(.horizontal, 24)
            
        }
    }
}


struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}



