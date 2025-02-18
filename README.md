# FontsGeneratorMacro

A Swift macro that automatically generates a set of static font properties and a helper method for custom font sizes based on a provided font name.

## Overview

`FontsGeneratorMacro` simplifies font management in your SwiftUI projects. By annotating an empty enum with the macro and providing a font name, the macro dynamically creates a variety of static font properties for common text styles (e.g., `largeTitle`, `title`, `body`, etc.) and a helper function to create a font with a custom size.

## Features

- **Automatic Font Property Generation:** Generates static properties for common text styles.
- **Custom Font Size Function:** Adds a method `ofSize(_:)` to create fonts with arbitrary sizes.
- **Built-in Error Handling:** Throws a descriptive error if no font name is provided.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/FontsGeneratorMacro.git
   cd FontsGeneratorMacro
   ```

2. **Open in Xcode:**

   Open the project in Xcode. This project uses SwiftSyntax macros, so it requires Swift 5.9 or later and the appropriate SwiftSyntax libraries.

3. **Build the Plugin:**

   Build the macro plugin target to ensure everything compiles correctly. Make sure your project settings support Swift compiler plugins.

## Usage

Annotate an empty enum with the `@FontGenerator` attribute and provide a `fontName` argument. For example:

```swift
@FontGenerator(fontName: "Zapfino")
enum Zapfino {}
```

When the macro expands, it generates the following code:

```swift
enum Zapfino {
    public static var largeTitle: Font {
        .custom("Zapfino", size: 34, relativeTo: .largeTitle)
    }
    public static var title: Font {
        .custom("Zapfino", size: 28, relativeTo: .title)
    }
    public static var title2: Font {
        .custom("Zapfino", size: 22, relativeTo: .title2)
    }
    public static var title3: Font {
        .custom("Zapfino", size: 20, relativeTo: .title3)
    }
    public static var body: Font {
        .custom("Zapfino", size: 17, relativeTo: .body)
    }
    public static var callout: Font {
        .custom("Zapfino", size: 16, relativeTo: .callout)
    }
    public static var subheadline: Font {
        .custom("Zapfino", size: 15, relativeTo: .subheadline)
    }
    public static var footnote: Font {
        .custom("Zapfino", size: 13, relativeTo: .footnote)
    }
    public static var caption: Font {
        .custom("Zapfino", size: 12, relativeTo: .caption)
    }
    public static var caption2: Font {
        .custom("Zapfino", size: 11, relativeTo: .caption2)
    }
    public static func ofSize(_ size: CGFloat) -> Font {
        .custom("Zapfino", size: size)
    }
}
```

### Error Handling

If you omit the `fontName` parameter, the macro will throw a `FontsGeneratorMacroError.missingFontName` error:

```swift
@FontGenerator()
enum TestFont {}
```

Always provide a valid font name:

```swift
@FontGenerator(fontName: "YourFontName")
enum YourFontEnum {}
```

## Testing

The repository includes tests that verify both the macro expansion and error handling:

1. **Run Tests in Xcode:**

   - Select the `FontsGeneratorMacroTests` scheme.
   - Press `Cmd + U` to run the tests.

2. **What’s Tested:**
   - Correct macro expansion into static properties and a helper function.
   - Throwing of `FontsGeneratorMacroError.missingFontName` when no font name is provided.

## Contributing

Contributions are welcome! Fork the repository and submit pull requests with your improvements, bug fixes, or new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
