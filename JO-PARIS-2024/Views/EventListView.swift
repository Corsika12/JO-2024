//
//  EventListView.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

import SwiftUI

struct EventListView: View {
    
    @EnvironmentObject var eventVM: EventViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach (eventVM.events){ event in
                    
                    ForEach (event.sportArray) { sport in
                        HStack (alignment: .top) {
                            Image(systemName: sport.iconSport)
                            
                            VStack (alignment: .leading){
                                Text(sport.sport)
                                Text(event.epreuve)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            //                    afficher la date ici
                            VStack {
                                Text(event.formatedDate, format: .dateTime.day().month().weekday())
                                
                                Text(event.formatedDate.formatted(date: .omitted, time: .shortened))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }.scrollContentBackground(.hidden)
        }
    }
}
        /*
         func sportFiltre() -> [Event] {
         
         print(userLocale)
         print(userCalendar)
         
         return events
         }
         */
        
        struct EventListView_Previews: PreviewProvider {
            static var previews: some View {
                EventListView()
            }
        }
