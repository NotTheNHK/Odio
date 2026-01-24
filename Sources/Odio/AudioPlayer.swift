//
// AudioPlayer.swift
// Odio
//
// Created by Barreloofy on 7/24/25 at 11:04 PM
//

import SwiftUI

/// A property wrapper that can playback audio.
///
/// > Important:
/// The underlying player is managed as a `@State` property wrapper.
/// As a result, rapid or successive calls to the `OdioPlayer` instance may not play audio if a previous playback is still active.
/// This is particularly noticeable with lengthy audio files or quick successive calls.
/// If this becomes a concern, call the `end()` method before initiating a new playback.
///
/// Use the `FileKey` initializer to quickly and safely initialize a new `@AudioPlayer`:
/// ```swift
/// extension FileKey {
///   @Entry var tap = "TapSound.mp3"
/// }
///
///	...
///
/// @AudioPlayer(\.tap) private var audioPlayer
/// ```
///
/// You can also initialize an empty `@AudioPlayer`, this is useful when the audio file to be used is not initially known, e.g,
/// here is an excerpt from one of the `audioFeedback` methods implementation:
/// ```swift
/// @AudioPlayer private var audioPlayer
///
///	let name: String
///
///	...
///
///	func body(content: Content) -> some View {
///		content
///			.onChange(of: name, initial: true) {
/// 			audioPlayer = OdioPlayer(
///					for: name,
///					configuration: configuration)
///			}
///
///		...
///
/// }
/// ```
///
/// Refer directly to an instance of `@AudioPlayer` to implicitly access its wrapped value.
/// ```swift
/// @AudioPlayer("TapSound.mp3") private var audioPlayer
///
/// var body: some View {
///   Button("Play Sound") { audioPlayer() }
/// }
/// ```
///	To learn more about customizing playback behavior, see: <doc:CustomizePlayback>.
///
@MainActor
@propertyWrapper
public struct AudioPlayer: DynamicProperty {
	/// The underlying `@State<OdioPlayer>` instance.
	@State
	private var player: OdioPlayer

	/// The underlying value referenced by the `@AudioPlayer` instance.
	///
	/// You don't typically access `wrappedValue` explicitly.
	/// Instead, you gain access to the wrapped value by referring to the instance
	/// that you create with `@AudioPlayer`.
	public var wrappedValue: OdioPlayer {
		get { player }
		nonmutating set { player = newValue }
	}

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
			self.player = OdioPlayer(
				filename,
				from: bundle,
				at: speed,
				after: delay,
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
		repeatMode: RepeatMode = .never) {
			self.player = OdioPlayer(
				data,
				at: speed,
				after: delay,
				repeatMode: repeatMode)
		}

	/// - Parameter feedback: The feedback to play.
	public init(
		_ feedback: AudioFeedback) {
			self.player = OdioPlayer(feedback)
		}

	/// Creates an empty `@AudioPlayer` instance.
	public init() { player = OdioPlayer() }
}
