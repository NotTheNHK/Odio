//
// Data+Init.swift
// Odio
//
// Created by NotTheNHK on 1/17/26 at 9:30 PM
//

import Foundation

extension Data {
	/// - Parameters:
	///   - name: The name of the audio file.
	///   - bundle: The bundle to retrieve the file from.
	init(
		name: String,
		bundle: Bundle = .main)
	throws {
		do {
			guard
				let url = bundle.url(forResource: name, withExtension: "")
			else { throw OdioError(errorDescription: "File could not be located.") }

			self = try Data(contentsOf: url)
		} catch {
			errorLogger.error("\(error.localizedDescription)")
			throw error
		}
	}

	/// - Parameters:
	///   - keyPath: A key path to a specific resulting value representing an audio file.
	///   - bundle: The bundle to retrieve the file from.
	init(
		keyPath: KeyPath<FileKey, String>,
		bundle: Bundle = .main)
	throws {
		do {
			guard
				let url = bundle.url(forResource: FileKey()[keyPath: keyPath], withExtension: "")
			else { throw OdioError(errorDescription: "File could not be located.") }

			self = try Data(contentsOf: url)
		} catch {
			errorLogger.error("\(error.localizedDescription)")
			throw error
		}
	}
}
