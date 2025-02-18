// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example:
///
///     @FontGenerator
///     enum Zapfino {
///         private static var fontName = "Zapfino"
///     }
///
///
/// produces:
///
///     enum Zapfino {
///       private static var fontName = "Zapfino"
///       public static var largeTitle: Font {
///           .custom(fontName, size: 34, relativeTo: .largeTitle)
///       }
///       public static var title: Font {
///           .custom(fontName, size: 28, relativeTo: .title)
///       }
///       public static var title2: Font {
///           .custom(fontName, size: 22, relativeTo: .title2)
///       }
///       public static var title3: Font {
///           .custom(fontName, size: 20, relativeTo: .title3)
///       }
///       public static var body: Font {
///           .custom(fontName, size: 17, relativeTo: .body)
///       }
///       public static var callout: Font {
///           .custom(fontName, size: 16, relativeTo: .callout)
///       }
///       public static var subheadline: Font {
///           .custom(fontName, size: 15, relativeTo: .subheadline)
///       }
///       public static var footnote: Font {
///           .custom(fontName, size: 13, relativeTo: .footnote)
///       }
///       public static var caption: Font {
///           .custom(fontName, size: 12, relativeTo: .caption)
///       }
///       public static var caption2: Font {
///           .custom(fontName, size: 11, relativeTo: .caption2)
///       }
///       public static func ofSize(_ size: CGFloat) -> Font {
///           .custom(fontName, size: size)
///       }
///     }
@attached(member, names: arbitrary)
public macro FontsGenerator(fontName: String) = #externalMacro(
  module: "FontsGeneratorMacroMacros",
  type: "FontsGeneratorMacro"
)
