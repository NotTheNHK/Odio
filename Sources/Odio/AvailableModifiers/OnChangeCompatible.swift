//
// OnChangeCompatible.swift
// Odio
//
// Created by Barreloofy on 11/14/25 at 6:40 PM
//

import SwiftUI

struct OnChangeCompatible<Value: Equatable>: ViewModifier {
	@State
	private var oldValue: Value?

	let value: Value
	let initial: Bool
	let action: (Value, Value) -> Void

	func body(content: Content) -> some View {
		if #available(iOS 17.0, macOS 14.0, *) {
			content
				.onChange(of: value, initial: initial, action)
		} else {
			content
				.onAppear {
					if initial {
						action(value, value)
						oldValue = value
					}
				}
				.onChange(of: value) { newValue in
					action(oldValue!, newValue)
					oldValue = newValue
				}
		}
	}
}


extension View {
	/// Adds a modifier for this view that fires an action when a specific value changes.
	/// - Parameters:
	///   - value: The value to check against when determining whether to run the closure.
	///   - initial: Whether the action should be run when this view initially appears.
	///   - action: A closure to run when the value changes.
	func onChangeCompatible<Value: Equatable>(
		of value: Value,
		initial: Bool = false,
		_ action: @escaping (_ oldValue: Value, _ newValue: Value) -> Void)
	-> some View {
		modifier(
			OnChangeCompatible(
				value: value,
				initial: initial,
				action: action))
	}

	/// Adds a modifier for this view that fires an action when a specific value changes.
	/// - Parameters:
	///   - value: The value to check against when determining whether to run the closure.
	///   - initial: Whether the action should be run when this view initially appears.
	///   - action: A closure to run when the value changes.
	func onChangeCompatible<Value: Equatable>(
		of value: Value,
		initial: Bool = false,
		_ action: @escaping () -> Void)
	-> some View {
		modifier(
			OnChangeCompatible(
				value: value,
				initial: initial,
				action: { _, _ in
					action()
				}))
	}
}
