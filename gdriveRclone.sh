#!/bin/bash

/usr/bin/rclone copy --ignore-existing --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/Downloads" "gdrive:ubuntu-downloads-folder" --max-size 500M

/usr/bin/rclone copy --ignore-existing --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/Documents" "gdrive:ubuntu-documents-folder" --max-size 500M

# /usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/Pictures" "gdrive:ubuntu-pictures-folder"

/usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/open-source" "gdrive:ubuntu-open-source-folder"

/usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/web-dev-learning" "gdrive:ubuntu-web-dev-learning-folder"

/usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/web-dev-projects" "gdrive:ubuntu-web-dev-projects-folder"

/usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/college-stuff" "gdrive:ubuntu-college-stuff-folder"

# /usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/web-dev" "gdrive:ubuntu-web-dev-folder"
# /usr/bin/rclone bisync --recover --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/animesh/Documents/obsidian" "gdrive:ubuntu-documents-folder/Obsidian"
