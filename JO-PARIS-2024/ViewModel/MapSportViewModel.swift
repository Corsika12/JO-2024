//
//  MapSportViewModel.swift
//  JO-PARIS-2024
//
//  Created by M on 30/06/2023.
//

// MapSportsViewModel.swift


/*

class MapSportsViewModel: ObservableObject {
    @Published var sportsDatas = [SportsDataVM]()
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    init() {
        loadData()
    }

    func loadData() {
        DispatchQueue.global(qos: .background).async { // Perform in the background
            guard let url = Bundle.main.url(forResource: "SportsData", withExtension: "json") else {
                print("Json file not found")
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // Use ISO 8601 date format
                self.sportsDatas = try decoder.decode([SportsDataVM].self, from: data)
                if let firstPlace = self.sportsDatas.first, let coordinate = firstPlace.coordinate {
                    DispatchQueue.main.async { // Update UI on the main thread
                        self.region.center = coordinate
                    }
                }
            } catch DecodingError.dataCorrupted(let context) {
                print("Data corrupted: ", context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key not found: ", key, context)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type mismatch: ", type, context)
            } catch DecodingError.valueNotFound(let type, let context) {
                print("Value not found: ", type, context)
            } catch {
                print("Failed to load and decode file: \(error.localizedDescription)")
            }
        }
    }
}

*/
