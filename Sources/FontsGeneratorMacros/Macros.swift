// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example:
///
///     enum Font {
///       @FontGenerator(fontName: "Zapfino")
///       enum Zapfino {}
///     }
///
///
/// produces:
///     enum Font {
///       enum Zapfino {
///         public static var largeTitle: Font {
///           .custom("Zapfino", size: 34, relativeTo: .largeTitle)
///         }
///
///         public static var title: Font {
///           .custom("Zapfino", size: 28, relativeTo: .title)
///         }
///
///         public static var title2: Font {
///           .custom("Zapfino", size: 22, relativeTo: .title2)
///         }
///
///         public static var title3: Font {
///           .custom("Zapfino", size: 20, relativeTo: .title3)
///         }
///
///         public static var body: Font {
///           .custom("Zapfino", size: 17, relativeTo: .body)
///         }
///
///         public static var callout: Font {
///           .custom("Zapfino", size: 16, relativeTo: .callout)
///         }
///
///         public static var subheadline: Font {
///           .custom("Zapfino", size: 15, relativeTo: .subheadline)
///         }
///
///         public static var footnote: Font {
///           .custom("Zapfino", size: 13, relativeTo: .footnote)
///         }
///
///         public static var caption: Font {
///           .custom("Zapfino", size: 12, relativeTo: .caption)
///         }
///
///         public static var caption2: Font {
///           .custom("Zapfino", size: 11, relativeTo: .caption2)
///         }
///
///         public static func ofSize(_ size: CGFloat) -> Font {
///           .custom("Zapfino", size: size)
///         }
///      }
///    }
@attached(member, names: arbitrary)
public macro FontsGenerator(fontName: String) = #externalMacro(
  module: "FontsGeneratorMacrosPlugin",  // This matches your .macro target name
  type: "FontsGeneratorMacro"
)
