import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

enum LocalizeError: CustomStringConvertible, Error {
    case onlyApplicableToString
    var description: String {
        switch self {
        case .onlyApplicableToString:
            return "@Localized can only be applied to an string"
        }
    }
}

public struct LocalizeMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression.as(StringLiteralExprSyntax.self) else {
            throw LocalizeError.onlyApplicableToString
        }
        
        return "NSLocalizedString(\(argument), comment: \(argument))"
    }
}

@main
struct LSSwiftMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LocalizeMacro.self,
    ]
}
