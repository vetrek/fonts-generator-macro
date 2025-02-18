import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

/// Defines errors that can occur in FontGeneratorMacro
public enum FontsGeneratorMacroError: Error, CustomStringConvertible {
  case missingFontName
  
  public var description: String {
    switch self {
    case .missingFontName:
      return "Font name is required for the macro."
    }
  }
}

public struct FontsGeneratorMacro: MemberMacro {
  public static func expansion(
    of attribute: AttributeSyntax,
    providingMembersOf declaration: some DeclGroupSyntax,
    in context: some MacroExpansionContext
  ) throws -> [DeclSyntax] {
    // Ensure the macro is used with an enum
    guard declaration.is(EnumDeclSyntax.self) else {
      return []
    }
    
    // Extract font name from macro arguments
    guard let fontName = attribute.arguments?
      .as(LabeledExprListSyntax.self)?
      .first(where: { $0.label?.text == "fontName" })?
      .expression
      .as(StringLiteralExprSyntax.self)?
      .segments.first?
      .as(StringSegmentSyntax.self)?
      .content.text
    else {
      throw FontsGeneratorMacroError.missingFontName
    }
    
    // Define the font sizes and corresponding system styles
    let textStyles: [(name: String, size: Int, relativeTo: String)] = [
      ("largeTitle", 34, "largeTitle"),
      ("title", 28, "title"),
      ("title2", 22, "title2"),
      ("title3", 20, "title3"),
      ("body", 17, "body"),
      ("callout", 16, "callout"),
      ("subheadline", 15, "subheadline"),
      ("footnote", 13, "footnote"),
      ("caption", 12, "caption"),
      ("caption2", 11, "caption2")
    ]
    
    // Generate font properties dynamically
    var declarations: [DeclSyntax] = textStyles.map { style in
      """
      public static var \(raw: style.name): Font {
        .custom("\(raw: fontName)", size: \(raw: style.size), relativeTo: .\(raw: style.relativeTo))
      }
      """
    }
    
    // Add a function to return a font of a custom size
    declarations.append("""
      public static func ofSize(_ size: CGFloat) -> Font {
        .custom("\(raw: fontName)", size: size)
      }
      """
    )
    
    return declarations
  }
}

@main
struct FontGeneratorPlugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    FontsGeneratorMacro.self,
  ]
}
