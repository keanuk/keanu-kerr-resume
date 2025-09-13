# Justfile for Typst resume building

# Default recipe - build the resume
default: build

# Build both English and German resumes to PDF
build:
    #!/usr/bin/env bash
    set -euo pipefail

    # Check if typst is installed
    if ! command -v typst &> /dev/null; then
        echo "Error: Typst is not installed."
        echo "Please install Typst from https://typst.app/docs/installation/"
        exit 1
    fi

    # Compile the English resume
    echo "Compiling English resume..."
    typst compile keanu-kerr-resume.typ keanu-kerr-resume.pdf

    # Compile the German resume
    echo "Compiling German Lebenslauf..."
    typst compile keanu-kerr-lebenslauf.typ keanu-kerr-lebenslauf.pdf

    if [ $? -eq 0 ]; then
        echo "✅ Both resumes compiled successfully!"
        echo "Outputs: keanu-kerr-resume.pdf, keanu-kerr-lebenslauf.pdf"
    else
        echo "❌ Compilation failed!"
        exit 1
    fi

# Watch for changes and rebuild automatically (English version)
watch:
    typst watch keanu-kerr-resume.typ keanu-kerr-resume.pdf

# Watch for changes and rebuild automatically (German version)
watch-de:
    typst watch keanu-kerr-lebenslauf.typ keanu-kerr-lebenslauf.pdf

# Clean generated files
clean:
    rm -f keanu-kerr-resume.pdf keanu-kerr-lebenslauf.pdf
    echo "🧹 Cleaned generated files"

# Check if Typst is installed
check:
    #!/usr/bin/env bash
    if command -v typst &> /dev/null; then
        echo "✅ Typst is installed: $(typst --version)"
    else
        echo "❌ Typst is not installed"
        echo "Install from: https://typst.app/docs/installation/"
        exit 1
    fi

# Open the generated English PDF (works on most systems)
open: build
    #!/usr/bin/env bash
    if command -v xdg-open &> /dev/null; then
        xdg-open keanu-kerr-resume.pdf
    elif command -v open &> /dev/null; then
        open keanu-kerr-resume.pdf
    else
        echo "Generated: keanu-kerr-resume.pdf"
        echo "Please open manually with your preferred PDF viewer"
    fi

# Open the generated German PDF (works on most systems)
open-de: build
    #!/usr/bin/env bash
    if command -v xdg-open &> /dev/null; then
        xdg-open keanu-kerr-lebenslauf.pdf
    elif command -v open &> /dev/null; then
        open keanu-kerr-lebenslauf.pdf
    else
        echo "Generated: keanu-kerr-lebenslauf.pdf"
        echo "Please open manually with your preferred PDF viewer"
    fi

# Show available recipes
help:
    @just --list
