#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Checking for tests matching changed files…"

# 1. Gather staged lib/*.dart files (Added or Modified)
files=(
  $(git diff --cached --name-only --diff-filter=AM \
    | grep '^lib/.*\.dart$' || true)
)

if [ ${#files[@]} -gt 0 ]; then
  missing=0
  for src in "${files[@]}"; do
    # Map lib/foo/bar.dart → test/foo/bar_test.dart
    rel="${src#lib/}"
    test_path="test/${rel%.dart}_test.dart"

    if [ ! -f "$test_path" ]; then
      echo "❌  Missing test for '$src'"
      echo "    Expected: '$test_path'"
      missing=1
    fi
  done

  if [ "$missing" -ne 0 ]; then
    echo
    echo "💡  Please add a test file for each changed source before pushing."
    exit 1
  fi
else
  echo "→ No lib/*.dart changes detected, skipping test-exist check."
fi

echo "✅ All changed files have matching tests."

# 2. Run full suite
echo "🧪 Running full test suite…"
flutter test --coverage
if [ $? -ne 0 ]; then
  echo "🚫 Some tests failed. Push aborted."
  exit 1
fi

echo "✅ Tests passed. Pushing…"
exit 0
