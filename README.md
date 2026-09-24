# dsc80-2026-fa

## Local preview

From this directory, run:

```bash
./preview.sh
```

Run this in Terminal or an editor's integrated terminal, and keep that terminal
open. Open <http://localhost:4000/> in your browser. Jekyll rebuilds when content
changes; refresh the browser to see updates. To stop, return to the terminal
running the script and press Ctrl+C. Closing the browser tab does not stop the
server. Restart after editing `_config.yml`.

If the port is occupied, stop the previous preview in its terminal or choose
another port with the command below. The script runs in the foreground; do not
append `&` if you want to stop it with Ctrl+C.

The script uses a modern Ruby (including installations under `~/.rubies/`),
installs missing gems into `.bundle/vendor/`, and previews at `/` without
changing the published site's base URL. Ruby 3.3.5 is verified for this project.
Internet access is required to download the remote theme at startup and rebuild.

```bash
./preview.sh build       # Build only, into _site/
PORT=4001 ./preview.sh   # Use another port if 4000 is occupied
```

The existing `resources/` symlinks cause duplicate-watch warnings; automatic
rebuilding still works. Older dependencies also emit Ruby deprecation warnings.
