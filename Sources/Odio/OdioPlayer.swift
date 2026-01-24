//
// OdioPlayer.swift
// Odio
//
// Created by Barreloofy on 7/25/25 at 6:31 PM
//

import AVFoundation

/// The underlying type used by `Odio` for audio playback.
public struct OdioPlayer {
	/// The underlying `AVAudioPlayer` instance.
	private let player: AVAudioPlayer?

	/// The speed at which playback occurs.
	public var speed: Float

	/// The delay before playback occurs.
	public var delay: TimeInterval

	/// The playback repeat mode.
	public var repeatMode: RepeatMode

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
		repeatMode: RepeatMode = .never) {
			self.player = makeAVAudioPlayer(forResource: filename, from: bundle)
			self.speed = speed
			self.delay = delay
			self.repeatMode = repeatMode
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
		repeatMode: RepeatMode = .never) {
			self.player = makeAVAudioPlayer(data: data)
			self.speed = speed
			self.delay = delay
			self.repeatMode = repeatMode
		}

	/// - Parameter feedback: The feedback to play.
	public init(
		_ feedback: AudioFeedback) {
			self.player = makeAVAudioPlayer(data: feedback.data)
			self.speed = feedback.configuration.speed
			self.delay = feedback.configuration.delay
			self.repeatMode = feedback.configuration.repeatMode
		}

	/// Creates an empty `OdioPlayer` instance.
	public init() {
		self.player = nil
		self.speed = 1
		self.delay = 0
		self.repeatMode = .never
	}

	/// Update the instance with the provided configuration.
	/// - Parameter configuration: The configuration to update the instance to.
	public mutating func update(with configuration: AudioConfiguration) {
		speed = configuration.speed
		delay = configuration.delay
		repeatMode = configuration.repeatMode
	}

	/// Starts playback, if the player was previously stoped, resumes playback
	/// otherwise starts a new playback. If player is empty does nothing.
	///
	/// You don't call this method directly, instead call the instance as a function.
	/// ```swift
	/// let odioPlayer = OdioPlayer("TapSound.mp3")
	///
	/// ...
	///
	/// odioPlayer()
	/// ```
	public func callAsFunction() {
		guard
			let player
		else { return }

		player.enableRate = speed != 1 ? true : false
		player.rate = speed
		player.numberOfLoops = repeatMode.numberOfLoops()
		player.play(atTime: player.deviceCurrentTime + delay)
	}

	/// Stops playback, to resume call the player as you would normally.
	public func stop() {
		player?.pause()
	}

	/// Ends playback, calling the player afterwards starts a new playback.
	public func end() {
		player?.stop()
		player?.currentTime = .zero
	}

	/// Resets the current audio playback timeline.
	public func rewind() {
		player?.currentTime = .zero
	}
}
