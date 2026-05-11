#!/bin/bash

# Script to update startpage style.css with current omarchy theme colors

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

THEME_COLORS_FILE="$HOME/.config/omarchy/current/theme/colors.css"
STYLE_FILE="$SCRIPT_DIR/style.css"
TEMPLATE_FILE="$SCRIPT_DIR/startpage-style.tpl"

echo "Updating startpage style with current omarchy theme colors..."

# Check if theme colors file exists
if [ ! -f "$THEME_COLORS_FILE" ]; then
    echo "Error: Theme colors file not found at $THEME_COLORS_FILE"
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
        
        # Also create RGB version for rgba() functions
        if [[ "$var_value" =~ ^#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$ ]]; then
            r="$((16#${BASH_REMATCH[1]}))"
            g="$((16#${BASH_REMATCH[2]}))"
            b="$((16#${BASH_REMATCH[3]}))"
            rgb_value="$r, $g, $b"
            sed -i "s/var(--${var_name}-rgb)/$rgb_value/g" "$TEMP_FILE"
        fi
    fi
done < "$THEME_COLORS_FILE"

# Also replace any remaining CSS custom properties with the actual values
while IFS= read -r line; do
    # Skip comment lines and empty lines in colors.css
    if [[ "$line" =~ ^[[:space:]]*# ]] || [[ -z "${line// }" ]]; then
        continue
    fi
    
    # Extract variable name and value from colors.css
    if [[ "$line" =~ ^@define-color[[:space:]]+([a-zA-Z0-9_]+)[[:space:]]+(#[0-9a-fA-F]+) ]]; then
        var_name="${BASH_REMATCH[1]}"
        var_value="${BASH_REMATCH[2]}"
        
        # Replace CSS custom properties in the temp file
        sed -i "s|--${var_name}: #[^;]*;|--${var_name}: ${var_value};|g" "$TEMP_FILE"
        
        # Also create RGB version for rgba() functions
        if [[ "$var_value" =~ ^#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$ ]]; then
            r="$((16#${BASH_REMATCH[1]}))"
            g="$((16#${BASH_REMATCH[2]}))"
            b="$((16#${BASH_REMATCH[3]}))"
            rgb_value="$r, $g, $b"
            sed -i "s/var(--${var_name}-rgb)/$rgb_value/g" "$TEMP_FILE"
        fi
    fi
done < "$THEME_COLORS_FILE"

# Move processed file to output location
mv "$TEMP_FILE" "$STYLE_FILE"

echo "Generated style.css with current theme colors"
echo "Theme: $(grep -o '@define-color.*' "$THEME_COLORS_FILE" | head -1 | cut -d' ' -f3)"
echo "Output: $STYLE_FILE"

# Make it readable
chmod 644 "$STYLE_FILE"

echo "Done! Refresh your startpage to see the new colors."
