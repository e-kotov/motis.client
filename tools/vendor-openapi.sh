#!/usr/bin/env bash
set -euo pipefail

SPEC_URL="https://raw.githubusercontent.com/motis-project/motis/master/openapi.yaml"
COMMITS_URL="https://api.github.com/repos/motis-project/motis/commits?path=openapi.yaml&per_page=1"
SPEC_PATH="tools/openapi.yaml"
META_PATH="tools/openapi.yaml.remote"

# Download spec
curl -fsSL "$SPEC_URL" -o "$SPEC_PATH"

# Record upstream commit that last touched this file
COMMIT_JSON=$(curl -fsSL "$COMMITS_URL")
SHA=$(echo "$COMMIT_JSON" | grep -m1 '"sha"' | cut -d'"' -f4)
DATE=$(echo "$COMMIT_JSON" | grep -m1 '"date"' | cut -d'"' -f4)

cat > "$META_PATH" <<EOF
commit: ${SHA}
date: ${DATE}
vendored: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
EOF

echo "Vendored from commit ${SHA:0:7}"
echo "Review changes: git diff tools/openapi.yaml"
