//
// EntryMacro.swift
// Odio
//
// Created by Barreloofy on 11/11/25 at 1:01 PM
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

public struct EntryMacro: AccessorMacro {
	public static func expansion(
		of node: AttributeSyntax,
		providingAccessorsOf declaration: some DeclSyntaxProtocol,
		in context: some MacroExpansionContext)
	throws -> [AccessorDeclSyntax] {
		guard
			let varDecl = declaration.as(VariableDeclSyntax.self),
			let binding = varDecl.bindings.first,
			let initializer = binding.initializer
		else { throw MacroExpansionErrorMessage("Entry macro can only be applied to 'var' declaration") }

		guard
			binding.accessorBlock == nil
		else { throw MacroExpansionErrorMessage("Entry macro can not be applied to 'computed property'") }


		guard
			let value = initializer.value.as(StringLiteralExprSyntax.self)
		else { throw MacroExpansionErrorMessage("Initializer expression could not be converted to type 'String'") }

		let getAccessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get)) { value }

		return [getAccessor]
	}
}


@main
struct EntryPlugin: CompilerPlugin {
	let providingMacros: [Macro.Type] = [
		EntryMacro.self,
	]
}
