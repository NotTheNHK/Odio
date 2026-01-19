//
// SwiftUIModifiers.swift
// Odio
//
// Created by Barreloofy on 5/30/25 at 12:46 PM
//

import SwiftUI

extension View {
	/// Plays the specified audio when the attached view is tapped.
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
				data: try? Data(name: fileName),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	/// Plays the specified audio when the attached view is tapped.
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
				data: try? Data(keyPath: keyPath),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	/// Plays the specified audio when the attached view is tapped.
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

	/// Plays the specified audio when the attached view is tapped.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - configuration: The configuration to use.
	public func audioFeedback(
		_ fileName: String,
		configuration: AudioConfiguration)
	-> some View {
		modifier(
			AudioOnTap(
				data: try? Data(name: fileName),
				configuration: configuration))
	}

	/// Plays the specified audio when the attached view is tapped.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - configuration: The configuration to use.
	public func audioFeedback(
		_ keyPath: KeyPath<FileKey, String>,
		configuration: AudioConfiguration)
	-> some View {
		modifier(
			AudioOnTap(
				data: try? Data(keyPath: keyPath),
				configuration: configuration))
	}

	/// Plays the specified audio when the attached view is tapped.
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
	/// Plays the specified audio when `trigger` changes.
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
				data: try? Data(name: fileName),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays the specified audio when `trigger` changes.
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
				data: try? Data(keyPath: keyPath),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays the specified audio when `trigger` changes.
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

	/// Plays the specified audio when `trigger` changes.
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
				data: try? Data(name: fileName),
				configuration: configuration,
				value: trigger))
	}

	/// Plays the specified audio when `trigger` changes.
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
				data: try? Data(keyPath: keyPath),
				configuration: configuration,
				value: trigger))
	}

	/// Plays the specified audio when `trigger` changes.
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


extension View {
	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: The closure to determine whether to play the specified audio when trigger changes.
	public func audioFeedback<Value: Equatable>(
		_ fileName: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: try? Data(name: fileName),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: condition))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: The closure to determine whether to play the specified audio when trigger changes.
	public func audioFeedback<Value: Equatable>(
		_ keyPath: KeyPath<FileKey, String>,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: try? Data(keyPath: keyPath),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: condition))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: The closure to determine whether to play the specified audio when trigger changes.
	public func audioFeedback<Value: Equatable>(
		data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: data,
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: condition))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - configuration: The configuration to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: The closure to determine whether to play the specified audio when trigger changes.
	public func audioFeedback<Value: Equatable>(
		_ fileName: String,
		configuration: AudioConfiguration,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: try? Data(name: fileName),
				configuration: configuration,
				value: trigger,
				condition: condition))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - configuration: The configuration to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: The closure to determine whether to play the specified audio when trigger changes.
	public func audioFeedback<Value: Equatable>(
		_ keyPath: KeyPath<FileKey, String>,
		configuration: AudioConfiguration,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: try? Data(keyPath: keyPath),
				configuration: configuration,
				value: trigger,
				condition: condition))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - configuration: The configuration to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: The closure to determine whether to play the specified audio when trigger changes.
	public func audioFeedback<Value: Equatable>(
		data: Data?,
		configuration: AudioConfiguration,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: data,
				configuration: configuration,
				value: trigger,
				condition: condition))
	}
}
