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
			.chooseAvailableOnChange(of: data, initial: true) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					data: data,
					configuration: configuration)
			}
			.chooseAvailableOnChange(of: configuration) {
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
			.chooseAvailableOnChange(of: value) {
				audioPlayer.rewind()
				audioPlayer()
			}
			.chooseAvailableOnChange(of: data, initial: true) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					data: data,
					configuration: configuration)
			}
			.chooseAvailableOnChange(of: configuration) {
				audioPlayer.update(with: configuration)
			}
			.onDisappear {
				audioPlayer.end()
			}
	}
}


struct AudioConditionally: ViewModifier {
	struct PlaybackTrigger: Equatable {
		let id = UUID()
		let value: Bool

		init(condition: () -> Bool) {
			value = condition()
		}

		func callAsFunction() -> Bool { value }
	}

	@AudioPlayer
	private var audioPlayer

	let data: Data?
	let configuration: AudioConfiguration
	let shouldPlay: PlaybackTrigger

	func body(content: Content) -> some View {
		content
			.chooseAvailableOnChange(of: shouldPlay) {
				guard shouldPlay() else { return }
				audioPlayer.rewind()
				audioPlayer()
			}
			.onAppear {
				audioPlayer = OdioPlayer(
					data: data,
					configuration: configuration)
				if shouldPlay() { audioPlayer() }
			}
			.chooseAvailableOnChange(of: data) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					data: data,
					configuration: configuration)
			}
			.chooseAvailableOnChange(of: configuration) {
				audioPlayer.update(with: configuration)
			}
			.onDisappear {
				audioPlayer.end()
			}
	}
}
