//
// AudioConfiguration.swift
// Odio
//
// Created by Barreloofy on 1/14/26 at 2:50 PM
//

import Foundation

public typealias AudioConfiguration = OdioConfiguration

/// A type who specifies the characteristics of an `OdioPlayer` instance.
public struct OdioConfiguration: Hashable {
	/// The speed at which playback occurs.
	public var speed: Float

	/// The delay before playback occurs.
	public var delay: TimeInterval

	/// The playback repeat mode.
	public var repeatMode: RepeatMode

	/// - Parameters:
	///   - speed: The speed at which playback occurs.
	///   - delay: The delay before playback occurs.
	///   - repeatMode: The playback repeat mode.
	public init(speed: Float, delay: TimeInterval, repeatMode: RepeatMode) {
		self.speed = speed
		self.delay = delay
		self.repeatMode = repeatMode
	}
}
