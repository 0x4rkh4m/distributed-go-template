#!/bin/bash

# This script sets up Git hooks in the .git/hooks directory.
# Ensure this script is executable before running it.

# Define the path to the Git hooks directory
HOOKS_DIR=".git/hooks"

# Create the hooks directory if it does not exist
mkdir -p "$HOOKS_DIR"

# Create the commit-msg hook script
cat << 'EOF' > "$HOOKS_DIR/commit-msg"
#!/bin/bash

# This hook script checks if the commit message follows the Conventional Commits standard.
commit_msg_file="$1"

# Call the commitlint.sh script to perform the check
./scripts/commitlint.sh "$commit_msg_file"
EOF

# Create the pre-commit hook script
cat << 'EOF' > "$HOOKS_DIR/pre-commit"
#!/bin/bash

# This hook script runs checks before a commit is made.
# You can add custom checks here, for example, code linting, tests, etc.
echo "Running pre-commit checks..."
# Exit with a non-zero status if any check fails to abort the commit
EOF

# Make the commit-msg and pre-commit scripts executable
chmod +x "$HOOKS_DIR/commit-msg"
chmod +x "$HOOKS_DIR/pre-commit"

# Ensure the commitlint.sh script is executable
chmod +x ./scripts/commitlint.sh

echo "Git hooks installed successfully."
