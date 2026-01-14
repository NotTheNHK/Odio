//
// AudioConfiguration.swift
// Odio
//
// Created by Barreloofy on 1/14/26 at 2:50 PM
//

import Foundation

public typealias AudioConfiguration = OdioConfiguration

/// The OdioPlayer's configuration.
public struct OdioConfiguration: Sendable, Equatable, Hashable {
	/// The speed at which playback occurs.
	public var speed: Float

	/// The delay before playback occurs.
	public var delay: TimeInterval

	/// The playback repeat mode.
	public var repeatMode: RepeatMode
}
