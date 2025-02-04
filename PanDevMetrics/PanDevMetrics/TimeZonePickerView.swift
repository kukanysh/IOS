//
//  WakaTimeExample.swift
//  PanDevMetrics
//
//  Created by Куаныш Спандияр on 31.01.2025.
//

import SwiftUI

struct TimeZonePickerView: View {
    @State private var selectedTimeZone = TimeZone.current.identifier
    let timeZones = TimeZone.knownTimeZoneIdentifiers.sorted()

    var body: some View {
        VStack {
            Text("Timezone")
                .padding(.leading, -190)

            Picker("", selection: $selectedTimeZone) {
                ForEach(timeZones, id: \.self) { timeZone in
                    Text(timeZone).tag(timeZone)
                }
            }
            .frame(width: 400)
            .pickerStyle(DefaultPickerStyle()) // Use `MenuPickerStyle()` for a dropdown

            Text("Selected: \(selectedTimeZone)")
                .padding()
        }
        .padding()
    }
}

struct TimeZonePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeZonePickerView()
    }
}
