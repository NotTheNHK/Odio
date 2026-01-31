//
// View+audioFeedback.swift
// Odio
//
// Created by Barreloofy on 5/30/25 at 12:46 PM
//

import SwiftUI

extension View {
	/// Plays the specified audio when the attached view is tapped.
	/// - Parameters:
	///   - filename: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	public func audioFeedback(
		_ filename: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	-> some View {
		modifier(
			AudioOnTap(
				audioFeedback: AudioFeedback(
					filename: filename,
					bundle: .main,
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
		_ data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	-> some View {
		modifier(
			AudioOnTap(
				audioFeedback: AudioFeedback(
					data: data,
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	/// Plays the specified audio when the attached view is tapped.
	/// - Parameter feedback: The feedback to play.
	public func audioFeedback(_ feedback: AudioFeedback) -> some View {
		modifier(
			AudioOnTap(audioFeedback: feedback))
	}
}


extension View {
	/// Plays the specified audio when `trigger` changes.
	/// - Parameters:
	///   - filename: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		_ filename: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				data: try? Data(forResource: filename),
				configuration: AudioConfiguration(
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
		_ data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				data: data,
				configuration: AudioConfiguration(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

	/// Plays the specified audio when `trigger` changes.
	/// - Parameters:
	///   - feedback: The feedback to play.
	///   - trigger: The value to monitor for changes.
	public func audioFeedback(
		_ feedback: AudioFeedback,
		_ trigger: some Equatable)
	-> some View {
		modifier(
			AudioOnChange(
				data: feedback.data,
				configuration: feedback.configuration,
				value: trigger))
	}
}


extension View {
	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - filename: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: A closure to determine whether to play the feedback when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		_ filename: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: try? Data(forResource: filename),
				configuration: AudioConfiguration(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: condition))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - filename: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: A closure to determine whether to play the feedback when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		_ filename: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: Value,
		condition: @escaping () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: try? Data(forResource: filename),
				configuration: AudioConfiguration(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: { _, _ in
					condition()
				}))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - trigger: The value to monitor for changes.
	///   - condition: A closure to determine whether to play the feedback when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		_ data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: data,
				configuration: AudioConfiguration(
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
	///   - condition: A closure to determine whether to play the feedback when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		_ data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		trigger: Value,
		condition: @escaping () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: data,
				configuration: AudioConfiguration(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: { _, _ in
					condition()
				}))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - feedback: The feedback to play.
	///   - trigger: The value to monitor for changes.
	///   - condition: A closure to determine whether to play the feedback when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		_ feedback: AudioFeedback,
		trigger: Value,
		condition: @escaping (_ oldValue: Value, _ newValue: Value) -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: feedback.data,
				configuration: feedback.configuration,
				value: trigger,
				condition: condition))
	}

	/// Plays the specified audio when `trigger` changes and the `condition` closure returns `true`.
	/// - Parameters:
	///   - feedback: The feedback to play.
	///   - trigger: The value to monitor for changes.
	///   - condition: A closure to determine whether to play the feedback when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		_ feedback: AudioFeedback,
		trigger: Value,
		condition: @escaping () -> Bool)
	-> some View {
		modifier(
			AudioConditionally(
				data: feedback.data,
				configuration: feedback.configuration,
				value: trigger,
				condition: { _, _ in
					condition()
				}))
	}
}


extension View {
	/// Plays the specifed `AudioFeedback` returned from the `feedback` closure when `trigger` changes or nothing when `nil` is returned.
	/// - Parameters:
	///   - trigger: The value to monitor for changes.
	///   - feedback: A closure to determine whether to play feedback and the feedback to play when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		trigger: Value,
		_ feedback: @escaping (_ oldValue: Value, _ newValue: Value) -> AudioFeedback?)
	-> some View {
		modifier(
			AudioFromClosure(
				value: trigger,
				feedback: feedback))
	}


	/// Plays the specifed `AudioFeedback` returned from the `feedback` closure when `trigger` changes or nothing when `nil` is returned.
	/// - Parameters:
	///   - trigger: The value to monitor for changes.
	///   - feedback: A closure to determine whether to play the feedback and the feedback to play when `trigger` changes.
	public func audioFeedback<Value: Equatable>(
		trigger: Value,
		_ feedback: @escaping () -> AudioFeedback?)
	-> some View {
		modifier(
			AudioFromClosure(
				value: trigger,
				feedback: { _, _ in
					feedback()
				}))
	}
}
