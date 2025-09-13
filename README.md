# Keanu Kerr Resume

This repository contains my professional resume built with Typst, a modern markup-based typesetting system.

## Files

- `keanu-kerr-resume.typ` - Main Typst resume source file
- `justfile` - Just command runner for building and managing the resume
- `build-typst.sh` - Shell script for building (alternative to just)

## Quick Start

### Prerequisites

Install Typst from [typst.app/docs/installation](https://typst.app/docs/installation/):

```bash
# Using cargo (Rust package manager)
cargo install --git https://github.com/typst/typst --locked typst-cli

# Or download precompiled binaries from GitHub releases
```

### Building the Resume

The easiest way to build the resume is using the provided `justfile`:

```bash
# Build the resume (default command)
just

# Or explicitly
just build

# Watch for changes and auto-rebuild
just watch

# Build and open the PDF
just open

# Clean generated files
just clean

# Check if Typst is installed
just check

# Show all available commands
just help
```

Alternatively, you can use the shell script or compile manually:

```bash
# Using the build script
./build-typst.sh

# Manual compilation
typst compile keanu-kerr-resume.typ keanu-kerr-resume-typst.pdf
```

## Why Typst?

Typst offers several advantages for resume creation:

1. **Fast Compilation**: Near-instant compilation compared to traditional systems
2. **Modern Syntax**: Clean, readable markup that's easy to understand and modify
3. **Better Error Messages**: Clear, helpful error reporting for debugging
4. **Unicode Support**: Built-in support for modern typography and symbols
5. **No Package Management**: No complex dependency management required
6. **Live Preview**: Watch mode for real-time updates during editing

## Font Requirements

The resume uses the **Inter** font for a clean, professional appearance. Typst will automatically fall back to a similar font if Inter is not available on your system.

## Resume Structure

The Typst version is built with reusable, modular functions:

- **`resume()`** - Main document setup with page formatting and header
- **`section()`** - Major sections with titles and horizontal dividers
- **`subsection()`** - Work experience and project entries with consistent formatting
- **`skills-table()`** - Specialized formatting for the skills section

## Customization

### Adding New Sections

```typst
#section("New Section")[
  Your content here...
]
```

### Adding Work Experience

```typst
#subsection(
  company: "Company Name",
  dates: "Start Date - End Date",
  position: "Your Position",
  location: "City, State",
  items: (
    "Achievement or responsibility 1",
    "Achievement or responsibility 2",
    "Achievement or responsibility 3"
  )
)
```

### Modifying Styles

Key styling parameters can be adjusted in the `resume()` function:
- Font size and family
- Page margins
- Line spacing
- Section spacing

## Output

The build process generates `keanu-kerr-resume-typst.pdf` - a professionally formatted, single-page resume optimized for both digital and print use.

## Development Workflow

For active editing, use the watch command to see changes in real-time:

```bash
just watch
```

This will automatically rebuild the PDF whenever you save changes to the `.typ` file.