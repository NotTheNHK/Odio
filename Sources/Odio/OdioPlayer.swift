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
	///   - fileName: The name of an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - bundle: The bundle to retrieve the file from.
	public init(
		for fileName: String,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		from bundle: Bundle = .main) {
			self.player = makeAVAudioPlayer(name: fileName, bundle: bundle)
			self.speed = speed
			self.delay = delay
			self.repeatMode = repeatMode
		}

	/// - Parameters:
	///   - fileName: The name of an audio file.
	///   - configuration: The configuration to use.
	///   - bundle: The bundle to retrieve the file from.
	public init(
		for fileName: String,
		configuration: AudioConfiguration,
		from bundle: Bundle = .main) {
			self.player = makeAVAudioPlayer(name: fileName, bundle: bundle)
			self.speed = configuration.speed
			self.delay = configuration.delay
			self.repeatMode = configuration.repeatMode
		}

	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	///   - bundle: The bundle to retrieve the file from.
	public init(
		from keyPath: KeyPath<FileKey, String>,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never,
		from bundle: Bundle = .main) {
			self.player = makeAVAudioPlayer(name: FileKey()[keyPath: keyPath], bundle: bundle)
			self.speed = speed
			self.delay = delay
			self.repeatMode = repeatMode
		}

	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - configuration: The configuration to use.
	///   - bundle: The bundle to retrieve the file from.
	public init(
		from keyPath: KeyPath<FileKey, String>,
		configuration: AudioConfiguration,
		from bundle: Bundle = .main) {
			self.player = makeAVAudioPlayer(name: FileKey()[keyPath: keyPath], bundle: bundle)
			self.speed = configuration.speed
			self.delay = configuration.delay
			self.repeatMode = configuration.repeatMode
		}

	/// - Parameters:
	///   - data: The audio data to play.
	///   - speed: The speed at which playback occurs.
	///   - delay: The time in seconds before playback occurs.
	///   - repeatMode: The playback repeat mode to use.
	public init(
		data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never) {
			self.player = makeAVAudioPlayer(data: data)
			self.speed = speed
			self.delay = delay
			self.repeatMode = repeatMode
		}

	/// - Parameters:
	///   - data: The audio data to play.
	///   - configuration: The configuration to use.
	public init(
		data: Data?,
		configuration: AudioConfiguration) {
			self.player = makeAVAudioPlayer(data: data)
			self.speed = configuration.speed
			self.delay = configuration.delay
			self.repeatMode = configuration.repeatMode
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
		guard let player else { return }

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
