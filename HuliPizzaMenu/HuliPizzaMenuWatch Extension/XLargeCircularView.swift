//
//  XLargeCircularView.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/30/20.
//

import SwiftUI
import ClockKit
struct XLargeCircularView: View {
    var stage:Int
    var stages = Stages()
    var colors:[Color] = [.clear,.red,.yellow,.green,.blue]
    var body: some View {
        VStack {
            Gauge(
                value: stages.fillFraction(stage: stage),
                in: 0...1,
                label: {
                    Text("Huli Pizza")
                },
                currentValueLabel: { Text(stages.emoji(stage)) },
                minimumValueLabel: { Text(stages.emoji(0)) },
                maximumValueLabel: { Text(stages.emoji(4)) }
            )
            .gaugeStyle(CircularGaugeStyle(tint: Gradient(colors:colors)))
            Spacer()
//            ProgressView(value: stages.fillFraction(stage: stage), label: {
//                Text(stages.emoji(stage))
//            })
//            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
            HStack{
                Spacer()
                Text(stages.text(stage))
                .font(.callout)
                Spacer()
            }
            Spacer()
        }
        //.background(Color.gray)
    }
}

struct XLargeCircularView_Previews: PreviewProvider {
    static var previews: some View {
        XLargeCircularView(stage:2)
        CLKComplicationTemplateGraphicExtraLargeCircularView(XLargeCircularView(stage:2))
            .previewContext()
    }
}
