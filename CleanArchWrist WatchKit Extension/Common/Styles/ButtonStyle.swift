//
//  ButtonStyle.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 10/8/21.
//

import SwiftUI

struct ButtonStyle: PrimitiveButtonStyle {
	let isSelected: Bool

	func makeBody(configuration: Self.Configuration) -> some View {
		Button(action: configuration.trigger) {
			configuration.label
				.padding([.leading, .trailing], 12)
		}
		.frame(height: 50)
	}
}
