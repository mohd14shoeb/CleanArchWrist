//
//  ContentView.swift
//  WatchSUI WatchKit Extension
//
//  Created by ANKIT SHARMA on 04/01/20.
//  Copyright © 2020 ANKIT SHARMA. All rights reserved.
//

import SwiftUI
import WatchKit

struct SamplesView: View {

    @State private var selectedFlavor = Flavor.chocolate
    @State var suggestedTopping: Topping = .cookies
    @State private var selectedTopping = Topping.nuts
    @State private var speed = 50.0
    @State private var isEditing = false
    @State private var progress = 0.5

    var body: some View {
        ScrollView {
            VStack {
                Picker("Suggest a topping for:", selection: $suggestedTopping) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor.suggestedTopping)
                    }
                }
                Text("suggestedTopping: \(suggestedTopping.rawValue)")
            }

            VStack {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                    }
                }
                Picker("Topping", selection: $selectedTopping) {
                    ForEach(Topping.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                    }
                }
                Text("Selected flavor: \(selectedFlavor.rawValue)")
                Text("Selected toppping: \(selectedTopping.rawValue)")
            }

            VStack {
                Label("Lightning", systemImage: "bolt.fill")
                Label("Lightning", systemImage: "bolt.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                Label("Lightning", systemImage: "bolt.fill")
                    .labelStyle(IconOnlyLabelStyle())
                VStack {
                    Label("Rain", systemImage: "cloud.rain")
                    Label("Snow", systemImage: "snow")
                    Label("Sun", systemImage: "sun.max")
                }
                .labelStyle(RedBorderedLabelStyle())
            }

            Label {
                Text("Laura")
                    .font(.body)
                    .foregroundColor(.primary)
                Text("Ms")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } icon: {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 44, height: 44, alignment: .center)
                    .overlay(Text("LFP"))
            }

            VStack {
                ProgressView(value: progress)
                Button("More", action: { progress += 0.05 })
            }
            ShadowedProgressViews()

            NavigationLink("More samples", destination: MoreSamplesView())
        }
    }
}

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts
    case cookies
    case blueberries

    var id: String { self.rawValue }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}

struct ShadowedProgressViews: View {
    var body: some View {
        VStack {
            ProgressView(value: 0.25)
            ProgressView(value: 0.75)
        }
        .progressViewStyle(DarkBlueShadowProgressViewStyle())
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}

struct RedBorderedLabelStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}

struct SamplesView_Previews: PreviewProvider {
    static var previews: some View {
        SamplesView()
    }
}
