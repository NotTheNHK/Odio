//
// View+audioFeedback.swift
// Odio
//
// Created by Barreloofy on 5/30/25 at 12:46 PM
//

import SwiftUI

extension View {
	public func audioFeedback(
		_ filename: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	-> some View {
		modifier(
			AudioOnTap(
				data: try? Data(forResource: filename),
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)))
	}

	public func audioFeedback(
		_ data: Data?,
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

	public func audioFeedback(_ feedback: AudioFeedback) -> some View {
		modifier(
			AudioOnTap(
				data: feedback.data,
				configuration: feedback.configuration))

	}
}


extension View {
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
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

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
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger))
	}

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
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: condition))
	}

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
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: { _, _ in
					condition()
				}))
	}

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
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: condition))
	}

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
				configuration: .init(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode),
				value: trigger,
				condition: { _, _ in
					condition()
				}))
	}

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
	public func audioFeedback<Value: Equatable>(
		trigger: Value,
		_ feedback: @escaping (_ oldValue: Value, _ newValue: Value) -> AudioFeedback?)
	-> some View {
		modifier(
			AudioFromClosure(
				value: trigger,
				feedback: feedback))
	}

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
