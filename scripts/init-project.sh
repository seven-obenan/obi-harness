#!/bin/bash

# Initialize a new project workspace from the Obi-Harness template.
#
# Usage:
#   ./scripts/init-project.sh <target-directory> "<project-name>"
#
# Example:
#   ./scripts/init-project.sh ~/projects/my-website "My Website Rebuild"

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="$REPO_DIR/template"

TARGET_DIR="$1"
PROJECT_NAME="$2"

if [ -z "$TARGET_DIR" ] || [ -z "$PROJECT_NAME" ]; then
  echo "Usage: $0 <target-directory> \"<project-name>\""
  echo ""
  echo "Example:"
  echo "  $0 ~/projects/my-website \"My Website Rebuild\""
  exit 1
fi

if [ -d "$TARGET_DIR" ] && [ "$(ls -A "$TARGET_DIR" 2>/dev/null)" ]; then
  echo "Error: $TARGET_DIR already exists and is not empty."
  echo "Choose an empty or non-existent directory."
  exit 1
fi

echo "Creating project workspace at: $TARGET_DIR"
echo "Project name: $PROJECT_NAME"
echo ""

# Copy template
mkdir -p "$TARGET_DIR"
cp -r "$TEMPLATE_DIR"/* "$TARGET_DIR"/
cp "$TEMPLATE_DIR"/.* "$TARGET_DIR"/ 2>/dev/null || true

# Replace placeholder with project name
if command -v sed &> /dev/null; then
  find "$TARGET_DIR" -name "*.md" -exec sed -i '' "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" {} + 2>/dev/null || \
  find "$TARGET_DIR" -name "*.md" -exec sed -i "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" {} +
fi

echo "Done. Project workspace created."
echo ""
echo "Next steps:"
echo "  1. Edit DOMAIN.md with your project's specific knowledge"
echo "  2. Edit BENCHMARKS.md with your success criteria"
echo "  3. Start working. Agents will read START_HERE.md first."
echo ""
echo "When the project matures, add the meta layer:"
echo "  cp -r $REPO_DIR/meta-template $TARGET_DIR/meta"
