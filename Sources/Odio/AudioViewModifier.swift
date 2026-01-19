//
// AudioViewModifier.swift
// Odio
//
// Created by Barreloofy on 1/14/26 at 8:29 PM
//

import SwiftUI

struct AudioOnTap: ViewModifier {
	@AudioPlayer
	private var audioPlayer

	let data: Data?
	let configuration: AudioConfiguration

	func body(content: Content) -> some View {
		content
			.simultaneousGesture(
				TapGesture()
					.onEnded {
						audioPlayer.rewind()
						audioPlayer()
					})
			.onChangeCompatible(of: data, initial: true) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					data: data,
					configuration: configuration)
			}
			.onChangeCompatible(of: configuration) {
				audioPlayer.update(with: configuration)
			}
			.onDisappear {
				audioPlayer.end()
			}
	}
}


struct AudioOnChange<Value: Equatable>: ViewModifier {
	@AudioPlayer
	private var audioPlayer

	let data: Data?
	let configuration: AudioConfiguration
	let value: Value

	func body(content: Content) -> some View {
		content
			.onChangeCompatible(of: value) {
				audioPlayer.rewind()
				audioPlayer()
			}
			.onChangeCompatible(of: data, initial: true) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					data: data,
					configuration: configuration)
			}
			.onChangeCompatible(of: configuration) {
				audioPlayer.update(with: configuration)
			}
			.onDisappear {
				audioPlayer.end()
			}
	}
}


struct AudioConditionally<Value: Equatable>: ViewModifier {
	@AudioPlayer
	private var audioPlayer

	let data: Data?
	let configuration: AudioConfiguration
	let value: Value
	let condition: (Value, Value) -> Bool

	func body(content: Content) -> some View {
		content
			.onChangeCompatible(of: value) { oldValue, newValue in
				guard
					condition(oldValue, newValue)
				else { return }

				audioPlayer.rewind()
				audioPlayer()
			}
			.onChangeCompatible(of: data, initial: true) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					data: data,
					configuration: configuration)
			}
			.onChangeCompatible(of: configuration) {
				audioPlayer.update(with: configuration)
			}
			.onDisappear {
				audioPlayer.end()
			}
	}
}
