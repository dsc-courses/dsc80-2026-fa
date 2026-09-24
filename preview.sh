#!/usr/bin/env bash
# Start the course website at http://localhost:4000/.
set -euo pipefail

cd "$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Report an existing server before installing dependencies or building the site.
if [[ "${1:-serve}" == serve ]] && command -v lsof >/dev/null; then
  listener_pids="$(lsof -nP -t -iTCP:"${PORT:-4000}" -sTCP:LISTEN 2>/dev/null || true)"
  if [[ -n "$listener_pids" ]]; then
    echo "Port ${PORT:-4000} is already in use (PID: $listener_pids)." >&2
    echo "Stop the existing preview with Ctrl+C in the terminal that started it," >&2
    echo "or run PORT=4001 ./preview.sh to use another port." >&2
    exit 1
  fi
fi

# Prefer an active modern Ruby; otherwise look in common local installations.
modern_ruby() {
  "$1" -e 'exit(Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.1") ? 0 : 1)' 2>/dev/null
}
if ! command -v ruby >/dev/null || ! modern_ruby "$(command -v ruby)"; then
  for ruby_bin in "$HOME"/.rubies/ruby-*/bin /opt/homebrew/opt/ruby@3.3/bin /opt/homebrew/opt/ruby/bin /usr/local/opt/ruby/bin; do
    if [[ -x "$ruby_bin/ruby" ]] && modern_ruby "$ruby_bin/ruby"; then
      export PATH="$ruby_bin:$PATH"
      break
    fi
  done
fi
if ! command -v ruby >/dev/null || ! modern_ruby "$(command -v ruby)"; then
  echo "Ruby 3.1 or newer is required. Install a modern Ruby and rerun this script." >&2
  exit 1
fi

# Keep dependencies local and preserve the committed dependency lockfile.
export BUNDLE_PATH="$PWD/.bundle/vendor"
export BUNDLE_FROZEN=true
bundler_version="$(ruby -e 'puts Gem::Specification.find_all_by_name("bundler").map(&:version).max')"
if [[ -z "$bundler_version" ]]; then
  echo "Bundler is missing. Run 'gem install bundler' for the selected Ruby." >&2
  exit 1
fi
bundle_cmd=(bundle "_${bundler_version}_")
echo "Using $(ruby --version)"
if ! "${bundle_cmd[@]}" check >/dev/null 2>&1; then
  "${bundle_cmd[@]}" install
fi

case "${1:-serve}" in
  build)
    exec "${bundle_cmd[@]}" exec jekyll build --baseurl ""
    ;;
  serve)
    echo "Preview: http://localhost:${PORT:-4000}/ (Ctrl+C to stop)"
    echo "Keep this terminal open. Press Ctrl+C here to stop the server."
    echo "Refresh after edits; restart this script after changing _config.yml."
    exec "${bundle_cmd[@]}" exec jekyll serve --watch --host 127.0.0.1 --port "${PORT:-4000}" --baseurl ""
    ;;
  *)
    echo "Usage: $0 [serve|build] (optional: PORT=4001)" >&2
    exit 2
    ;;
esac
