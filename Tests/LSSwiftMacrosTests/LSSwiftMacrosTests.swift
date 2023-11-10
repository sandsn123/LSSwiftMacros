import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(LSSwiftMacrosMacros)
import LSSwiftMacrosMacros

let testMacros: [String: Macro.Type] = [
    "Localized": LocalizeMacro.self,
]
#endif

final class LSSwiftMacrosTests: XCTestCase {
    func testDefault_HappyPath() {
        assertMacroExpansion(
            """
            struct Person {
                @Localized
                var name: String {
                    "123"
                }
            }
            """,
            expandedSource: #"""
            struct Person {
                @Localized
                var name: String {
                    "123"
                }
            }
            """#,
            macros: testMacros
        )
    }
}
