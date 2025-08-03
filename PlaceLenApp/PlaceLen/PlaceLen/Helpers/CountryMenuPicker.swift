//
//  CountryMenuPicker.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 2/08/25.
//

import SwiftUI

struct CountryMenuPicker: View {
    @ObservedObject var vm: CountryPickerViewModel

    var body: some View {
        Menu {
            ForEach(vm.countries) { country in
                Button {
                    vm.selected = country
                } label: {
                    Text("\(country.flag) \(country.name) \(country.dialCode)")
                }
            }
        } label: {
            HStack {
                Text(vm.selected?.flag ?? "🌐").foregroundColor(.primary)
                Text(vm.selected?.dialCode ?? "+").foregroundColor(.primary)
                Image(systemName: "chevron.down").foregroundColor(Color(hex: "#2E6B44"))
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 10)
            .background(Color(.white))
            .cornerRadius(8)
        }
    }
}
