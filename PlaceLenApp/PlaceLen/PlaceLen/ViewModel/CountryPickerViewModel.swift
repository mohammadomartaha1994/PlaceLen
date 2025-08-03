//
//  CountryPickerViewModel.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 2/08/25.
//
import Foundation

@MainActor
class CountryPickerViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var selected: Country?
    @Published var phoneNumber = ""
    
    init() {
        loadCountries()
    }
    
    func loadCountries() {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            print("❌ countries.json not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([APICountry].self, from: data)
            let mapped = decoded.compactMap(Country.init).sorted { $0.name < $1.name }
            self.countries = mapped
            if selected == nil { selected = mapped.first }
        } catch {
            print("❌ Error loading countries: \(error)")
        }
    }
}
