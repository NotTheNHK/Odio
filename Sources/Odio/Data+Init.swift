//
// Data+Init.swift
// Odio
//
// Created by NotTheNHK on 1/17/26 at 9:30 PM
//

import Foundation

extension Data {
	init(
		forResource name: String,
		withExtension `extension`: String? = nil,
		subdirectory subpath: String? = nil,
		from bundle: Bundle = .main)
	throws {
		do {
			guard
				let url = bundle.url(
					forResource: name,
					withExtension: `extension`,
					subdirectory: subpath)
			else { throw OdioError(errorDescription: "Resource not found: \(name).\(`extension` ?? "")") }

			self = try Data(contentsOf: url)
		} catch {
			errorLogger.error("\(error.localizedDescription)")
			throw error
		}
	}
}
