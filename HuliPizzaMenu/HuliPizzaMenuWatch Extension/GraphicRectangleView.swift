//
//  GraphicRectangleView.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/31/20.
//

import SwiftUI
import ClockKit

struct GraphicRectangleView: View {
    var stage:Int
    var stages = Stages()
    var body: some View {
        HStack {
            Text(stages.emoji(stage)).font(.largeTitle)
            VStack{
                Text("Huli Pizza Co.")
                Gauge(value: stages.fillFraction(stage: stage), in: 0...1, label: {
                    /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
                })
                .gaugeStyle(LinearGaugeStyle(tint: Gradient(colors:[.red,.yellow])))
                Text(stages.text(stage)).font(.caption)
            }
        }
    }
}

struct GraphicRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicRectangularFullView(
        GraphicRectangleView(stage:2))
            .previewContext()
    }
}
