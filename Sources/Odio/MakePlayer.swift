//
// MakePlayer.swift
// Odio
//
// Created by Barreloofy on 7/24/25 at 6:18 PM
//

import AVFoundation

/// Creates an `AVAudioPlayer` from the contents of a file.
/// - Parameters:
///   - name: The name of the audio file.
///   - bundle: The bundle to retrieve the file from.
/// - Returns: An instance of `AVAudioPlayer` with the contents of the file, if an error occured `nil`.
func makeAVAudioPlayer(
	forResource name: String,
	withExtension `extension`: String? = nil,
	subdirectory subpath: String? = nil,
	from bundle: Bundle = .main)
-> AVAudioPlayer? {
	do {
		guard
			let url = bundle.url(
				forResource: name,
				withExtension: `extension`,
				subdirectory: subpath)
		else { throw OdioError(errorDescription: "Resource not found: \(name).\(`extension` ?? "")") }

		let player = try AVAudioPlayer(contentsOf: url)

		player.prepareToPlay()
		return player
	} catch {
		errorLogger.error("\(error.localizedDescription)")
		return nil
	}
}

/// Creates an `AVAudioPlayer` from audio data.
/// - Parameters:
/// 	- data: The audio data to play.
/// - Returns: An instance of `AVAudioPlayer` with the contents of the provided data, if an error occured `nil`.
func makeAVAudioPlayer(data: Data?) -> AVAudioPlayer? {
	do {
		guard
			let data
		else { throw OdioError(errorDescription: "Parameter `data` was nil") }

		let player = try AVAudioPlayer(data: data)

		player.prepareToPlay()
		return player
	} catch {
		errorLogger.error("\(error.localizedDescription)")
		return nil
	}
}
