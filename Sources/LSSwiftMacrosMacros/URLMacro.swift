//
//  File.swift
//  
//
//  Created by czi on 2023/11/10.
//

import Foundation
import SwiftSyntaxMacros
import SwiftSyntax

public struct URLMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression,
              let segments = argument.as(StringLiteralExprSyntax.self)?.segments
        else {
            fatalError("#URL requires a static string literal")
        }

        guard let _ = URL(string: segments.description) else {
            fatalError("Malformed url: \(argument)")
        }

        return "URL(string: \(argument))!"
    }
}
