#!/bin/bash

# Script to generate userChrome-omarchy.css from template using current omarchy theme colors

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

THEME_COLORS_FILE="$HOME/.config/omarchy/current/theme/colors.css"
TEMPLATE_FILE="$SCRIPT_DIR/userChrome-omarchy.tpl"
OUTPUT_FILE="$SCRIPT_DIR/userChrome.css"

# Check if theme colors file exists
if [ ! -f "$THEME_COLORS_FILE" ]; then
    echo "Error: Theme colors file not found at $THEME_COLORS_FILE"
    exit 1
fi

# Check if template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found at $TEMPLATE_FILE"
    exit 1
fi

# Create temporary file for processing
TEMP_FILE=$(mktemp)

# Copy template to temp file
cp "$TEMPLATE_FILE" "$TEMP_FILE"

# Process the template file by replacing @variable syntax with actual hex values
while IFS= read -r line; do
    # Skip comment lines and empty lines in colors.css
    if [[ "$line" =~ ^[[:space:]]*# ]] || [[ -z "${line// }" ]]; then
        continue
    fi
    
    # Extract variable name and value from colors.css
    if [[ "$line" =~ ^@define-color[[:space:]]+([a-zA-Z0-9_]+)[[:space:]]+(#[0-9a-fA-F]+) ]]; then
        var_name="${BASH_REMATCH[1]}"
        var_value="${BASH_REMATCH[2]}"
        
        # Replace all occurrences of @variable_name in the temp file
        sed -i "s/@$var_name/$var_value/g" "$TEMP_FILE"
    fi
done < "$THEME_COLORS_FILE"

# Move processed file to output location
mv "$TEMP_FILE" "$OUTPUT_FILE"

echo "Generated userChrome-omarchy.css with current theme colors"
echo "Output: $OUTPUT_FILE"

# Make it executable
chmod 644 "$OUTPUT_FILE"
