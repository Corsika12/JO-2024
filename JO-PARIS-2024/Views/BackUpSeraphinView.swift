//
//  BackUpSeraphinView
//  JO-PARIS-2024
//
//
//

/*
 
 import SwiftUI



 struct EventsView: View {
     
     @EnvironmentObject var eventVM: EventViewModel
     //    @StateObject var vm : EventVM = EventVM(sport: false, date: false)
     
     var body: some View {
         VStack {
             HStack{
                 Text("Évenements")
                     .font(.custom("Paris2024", size: 24))
                     .foregroundColor(Color("RougeAmour"))
                     .padding()
                 
                 Spacer()
             }
             
             Spacer(minLength: 16)
             
             HStack {
                 Spacer()
                 ButtonEvent(txt: "Dates", isPresented: $eventVM.date)
                 Spacer()
                 ButtonEvent(txt: "Sport", isPresented: $eventVM.sport)
                 Spacer()
             }
         }
         .tint(Color("Apache"))
         
         /*
          if eventVM.sport {
          SportListView()
          } else {
          EventListView()
          }
          */
         
         Spacer()
         
         MapSportsView()
             .tint(Color("Apache"))
     }
 }



 struct EventsView_Previews: PreviewProvider {
     static var previews: some View {
         EventsView()
             .environmentObject(EventViewModel())
     }
 }



 struct SportListView: View {
     
     @EnvironmentObject var sportVM: SportViewModel
     
     var body: some View {
         VStack {
             List{
                 ForEach(sportVM.sports) { sport in
                     HStack {
                         Image(systemName: sport.iconSport)
                         Text(sport.sport)
                     }
                 }.listRowBackground(Color("Pearl Bush"))
             }.scrollContentBackground(.hidden)
         }
         .onAppear{
             Task{
                 await sportVM.fetchSport()
             }
         }
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

 
 */













//***************************************************

/*
struct BackUpSeraphinView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BackUpSeraphinView_Previews: PreviewProvider {
    static var previews: some View {
        BackUpSeraphinView()
    }
}
*/
