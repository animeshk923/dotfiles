# Source - https://superuser.com/a
# Posted by popey, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-04, License - CC BY-SA 4.0

#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

