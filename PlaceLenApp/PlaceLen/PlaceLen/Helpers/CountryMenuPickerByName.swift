//
//  CountryMenuPickerByName.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 31/08/25.
//

import SwiftUI

struct CountryMenuPickerByName: View {
    @ObservedObject var vm: CountryPickerViewModel

    var body: some View {
        Menu {
            ForEach(vm.countries) { country in
                Button {
                    vm.selected = country
                } label: {
                    // Show only flag and country name
                    Text("\(country.flag) \(country.name)")
                }
            }
        } label: {
            HStack {
                Text(vm.selected?.flag ?? "🌐")
                Text(vm.selected?.name ?? "Select Country")
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(Color(hex: "#2E6B44"))
            }
            .foregroundColor(.primary)
            .padding(.vertical, 15)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}
