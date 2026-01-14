//
// SwiftUIModifiers.swift
// Odio
//
// Created by Barreloofy on 5/30/25 at 12:46 PM
//

import SwiftUI

// MARK: - Name-based ViewModifier's and view methods.

// TODO: Create configuration overload.

struct AudioOnTap: ViewModifier {
	@AudioPlayer
	private var audioPlayer

	let name: String
	let configuration: AudioConfiguration

	func body(content: Content) -> some View {
		content
			.simultaneousGesture(
				TapGesture()
					.onEnded {
						audioPlayer.rewind()
						audioPlayer()
					})
			.chooseAvailableOnChange(of: name, initial: true) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					for: name,
					configuration: configuration)
			}
			.chooseAvailableOnChange(of: configuration) {
				audioPlayer.updateWith(configuration: configuration)
			}
			.onDisappear {
				audioPlayer.end()
			}
	}
}


struct AudioOnChange<Value: Equatable>: ViewModifier {
	@AudioPlayer
	private var audioPlayer

	let name: String
	let configuration: AudioConfiguration
	let value: Value

	func body(content: Content) -> some View {
		content
			.chooseAvailableOnChange(of: value) {
				audioPlayer.rewind()
				audioPlayer()
			}
			.chooseAvailableOnChange(of: name, initial: true) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					for: name,
					configuration: configuration)
			}
			.chooseAvailableOnChange(of: configuration) {
				audioPlayer.updateWith(configuration: configuration)
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

	let name: String
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
					for: name,
					configuration: configuration)
				if shouldPlay() { audioPlayer() }
			}
			.chooseAvailableOnChange(of: name) {
				audioPlayer.end()
				audioPlayer = OdioPlayer(
					for: name,
					configuration: configuration)
			}
			.onDisappear {
				audioPlayer.end()
			}
	}
}


extension View {
	/// Plays audio when the attached view is tapped.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	public func audioFeedback(
		_ fileName: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	-> some View {
		modifier(
			AudioOnTap(
				name: fileName,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	/// Plays audio when `trigger` changes.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		_ fileName: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				name: fileName,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays audio when `shouldPlay` is evaluated to true.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - shouldPlay: The value to monitor for true.
	public func audioFeedback(
		_ fileName: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		shouldPlay: () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				name: fileName,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				shouldPlay: .init(condition: shouldPlay)))
	}

	/// Plays audio when the attached view is tapped.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	public func audioFeedback(
		_ keyPath: KeyPath<FileKey, String>,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,)
	-> some View {
		modifier(
			AudioOnTap(
				name: FileKey()[keyPath: keyPath],
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	/// Plays audio when `trigger` changes.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		_ keyPath: KeyPath<FileKey, String>,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				name: FileKey()[keyPath: keyPath],
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays audio when `shouldPlay` is evaluated to true.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - shouldPlay: The value to monitor for true.
	public func audioFeedback(
		_ keyPath: KeyPath<FileKey, String>,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		shouldPlay: () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				name: FileKey()[keyPath: keyPath],
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				shouldPlay: .init(condition: shouldPlay)))
	}
}

// MARK: - Data-based ViewModifier's and view methods.

struct AudioDataOnTap: ViewModifier {
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
			.onDisappear {
				audioPlayer.end()
			}
	}
}


struct AudioDataOnChange<Value: Equatable>: ViewModifier {
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
			.onDisappear {
				audioPlayer.end()
			}
	}
}


struct AudioDataConditionally: ViewModifier {
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
			.onDisappear {
				audioPlayer.end()
			}
	}
}


extension View {
	/// Plays audio when the attached view is tapped.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	public func audioFeedback(
		data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	-> some View {
		modifier(
			AudioDataOnTap(
				data: data,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	/// Plays audio when `trigger` changes.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioDataOnChange(
				data: data,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays audio when `shouldPlay` is evaluated to true.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - shouldPlay: The value to monitor for true.
	public func audioFeedback(
		data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		shouldPlay: () -> Bool)
	-> some View {
		modifier(
			AudioDataConditionally(
				data: data,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				shouldPlay: .init(
					condition: shouldPlay)))
	}
}
