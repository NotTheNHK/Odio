//
// SwiftUIModifiers.swift
// Odio
//
// Created by Barreloofy on 5/30/25 at 12:46 PM
//

import SwiftUI

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
				data: audioData(
					name: fileName),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
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
				data: audioData(
					name: FileKey()[keyPath: keyPath]),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

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
			AudioOnTap(
				data: data,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	/// Plays audio when the attached view is tapped.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - configuration: The configuration to use.
	public func audioFeedback(
		_ fileName: String,
		configuration: AudioConfiguration)
	-> some View {
		modifier(
			AudioOnTap(
				data: audioData(
					name: fileName),
				configuration: configuration))
	}

	/// Plays audio when the attached view is tapped.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - configuration: The configuration to use.
	public func audioFeedback(
		_ keyPath: KeyPath<FileKey, String>,
		configuration: AudioConfiguration)
	-> some View {
		modifier(
			AudioOnTap(
				data: audioData(
					name: FileKey()[keyPath: keyPath]),
				configuration: configuration))
	}

	/// Plays audio when the attached view is tapped.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - configuration: The configuration to use.
	public func audioFeedback(
		data: Data?,
		configuration: AudioConfiguration)
	-> some View {
		modifier(
			AudioOnTap(
				data: data,
				configuration: configuration))
	}
}


extension View {
	/// Plays audio on `trigger` changes.
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
				data: audioData(
					name: fileName),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays audio on `trigger` changes.
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
				data: audioData(
					name: FileKey()[keyPath: keyPath]),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays audio on `trigger` changes.
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
			AudioOnChange(
				data: data,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays audio on `trigger` changes.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - configuration: The configuration to use.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		_ fileName: String,
		configuration: AudioConfiguration,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				data: audioData(name: fileName),
				configuration: configuration,
				value: trigger))
	}

	/// Plays audio on `trigger` changes.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - configuration: The configuration to use.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		_ keyPath: KeyPath<FileKey, String>,
		configuration: AudioConfiguration,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				data: audioData(
					name: FileKey()[keyPath: keyPath]),
				configuration: configuration,
				value: trigger))
	}

	/// Plays audio on `trigger` changes.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - configuration: The configuration to use.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		data: Data?,
		configuration: AudioConfiguration,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				data: data,
				configuration: configuration,
				value: trigger))
	}
}

// TODO: Update `shouldPlay` description
extension View {
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
				data: audioData(
					name: fileName),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				shouldPlay: .init(condition: shouldPlay)))
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
				data: audioData(
					name: FileKey()[keyPath: keyPath]),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				shouldPlay: .init(condition: shouldPlay)))
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
			AudioConditionally(
				data: data,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				shouldPlay: .init(
					condition: shouldPlay)))
	}

	/// Plays audio when `shouldPlay` is evaluated to true.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - configuration: The configuration to use.
	///   - shouldPlay: The value to monitor for true.
	public func audioFeedback(
		_ fileName: String,
		configuration: AudioConfiguration,
		shouldPlay: () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: audioData(
					name: fileName),
				configuration: configuration,
				shouldPlay: .init(
					condition: shouldPlay)))
	}

	/// Plays audio when `shouldPlay` is evaluated to true.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - configuration: The configuration to use.
	///   - shouldPlay: The value to monitor for true.
	public func audioFeedback(
		_ keyPath: KeyPath<FileKey, String>,
		configuration: AudioConfiguration,
		shouldPlay: () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: audioData(
					name: FileKey()[keyPath: keyPath]),
				configuration: configuration,
				shouldPlay: .init(
					condition: shouldPlay)))
	}

	/// Plays audio when `shouldPlay` is evaluated to true.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - configuration: The configuration to use.
	///   - shouldPlay: The value to monitor for true.
	public func audioFeedback(
		data: Data?,
		configuration: AudioConfiguration,
		shouldPlay: () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: data,
				configuration: configuration,
				shouldPlay: .init(
					condition: shouldPlay)))
	}
}
