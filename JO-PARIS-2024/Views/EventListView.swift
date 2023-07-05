//
//  EventListView.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

import SwiftUI

struct EventListView: View {
    var body: some View {
        List {
            ForEach (sportFiltre()){ event in
                HStack(alignment: .top) {
                    Image(systemName: event.sport.iconSport)
                    
                    VStack (alignment: .leading){
                        Text(event.sport.sport)
                        Text(event.epreuve)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    //                    afficher la date ici
                    VStack {
                        Text(event.dateEvent, format: .dateTime.day().month().weekday())
                        
                        Text(event.dateEvent.formatted(date: .omitted, time: .shortened))
                            .foregroundColor(.gray)
                    }
                }
            }
        }.scrollContentBackground(.hidden)
    }
}


func sportFiltre() -> [Event] {
    
    print(userLocale)
    print(userCalendar)
    
    return events
}


struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
