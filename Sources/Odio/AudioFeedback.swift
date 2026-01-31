//
// AudioFeedback.swift
// Odio
//
// Created by NotTheNHK on 1/21/26 at 4:46 PM
//

import Foundation

/// Represents the audio and its configuration to play.
public struct AudioFeedback: Equatable {
	let data: Data
	let configuration: AudioConfiguration

	/// - Parameters:
	///   - filename: The name of an audio file.
	///   - bundle: The bundle to retrieve the file from.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	public init(
		_ filename: String,
		from bundle: Bundle = .main,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	throws {
		self.data = try Data(forResource: filename)
		self.configuration = AudioConfiguration(
			speed: speed,
			delay: delay,
			repeatMode: repeatMode)
	}

	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	public init(
		_ data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	throws {
		guard
			let data
		else { throw OdioError(errorDescription: "Parameter `data` was nil") }

		self.data = data
		self.configuration = AudioConfiguration(
			speed: speed,
			delay: delay,
			repeatMode: repeatMode)
	}

	/// internal initializer. Creates an "empty" instance.
	/// - Parameters:
	///   - filename: The name of an audio file.
	///   - bundle: The bundle to retrieve the file from.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	init(
		filename: String,
		bundle: Bundle,
		speed: Float,
		delay: TimeInterval,
		repeatMode: RepeatMode) {
			do {
				self.data = try Data(forResource: filename, from: bundle)
				self.configuration = AudioConfiguration(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)
			} catch {
				self.data = Data()
				self.configuration = AudioConfiguration()
			}
		}

	/// internal initializer. Creates an "empty" instance.
	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	init(
		data: Data?,
		speed: Float,
		delay: TimeInterval,
		repeatMode: RepeatMode) {
			do {
				guard
					let data
				else { throw OdioError(errorDescription: "Parameter 'data' is nil")}

				self.data = data
				self.configuration = AudioConfiguration(
					speed: speed,
					delay: delay,
					repeatMode: repeatMode)
			} catch {
				self.data = Data()
				self.configuration = AudioConfiguration()
			}
		}
}
