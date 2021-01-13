//
//  MoreSamplesView.swift
//  WatchSUI WatchKit Extension
//
//  Created by Laura on 13/1/21.
//  Copyright © 2021 ANKIT SHARMA. All rights reserved.
//

import SwiftUI

struct MoreSamplesView: View {

    @State private var batteryLevel = 0.4
    @State private var speed = 50.0
    @State private var isEditing = false

    var body: some View {
        Gauge(value: batteryLevel) {
            Text("Battery Level")
        }
        LabeledGauge()
        StyledGauge()

        Slider(
                value: $speed,
                in: 0...100,
                step: 5,
                onEditingChanged: { editing in
                    isEditing = editing
                },
                minimumValueLabel: Text("0"),
                maximumValueLabel: Text("100")
            ) {
                Text("Speed")
            }
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
    }
}

struct LabeledGauge: View {
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 170.0

    var body: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("BPM")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
        .gaugeStyle(CircularGaugeStyle())
    }
}

struct StyledGauge: View {
    @State private var current = 67.0
    @State private var minValue = 50.0
    @State private var maxValue = 170.0
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])

    var body: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundColor(Color.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundColor(Color.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundColor(Color.red)
        }
        .gaugeStyle(CircularGaugeStyle(tint: gradient))
    }
}

struct MoreSamplesView_Previews: PreviewProvider {
    static var previews: some View {
        MoreSamplesView()
    }
}
