// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro Localized(_ stringResource: String) -> String = #externalMacro(module: "LSSwiftMacrosMacros", type: "LocalizeMacro")


// url macro
@freestanding(expression) 
public macro URL(_ stringLiteral: String) -> URL = #externalMacro(module: "LSSwiftMacrosMacros", type: "URLMacro")

