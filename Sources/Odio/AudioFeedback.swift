//
// AudioFeedback.swift
// Odio
//
// Created by NotTheNHK on 1/21/26 at 4:46 PM
//

import Foundation

public struct AudioFeedback: Equatable {
	let data: Data
	let configuration: AudioConfiguration

	public init(
		_ filename: String,
		from bundle: Bundle = .main,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	throws {
		self.data = try Data(forResource: filename)
		self.configuration = .init(
			speed: speed,
			delay: delay,
			repeatMode: repeatMode)
	}

	public init(
		_ data: Data?,
		at speed: Float = 1,
		after delay: TimeInterval = 0,
		repeatMode: RepeatMode = .never)
	throws {
		guard
			let data
		else { throw OdioError(errorDescription: "Nil") }

		self.data = data
		self.configuration = .init(
			speed: speed,
			delay: delay,
			repeatMode: repeatMode)
	}
}
