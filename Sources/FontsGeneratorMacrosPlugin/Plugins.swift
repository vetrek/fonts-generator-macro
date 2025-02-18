import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct FontGeneratorPlugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    FontsGeneratorMacro.self,
  ]
}
