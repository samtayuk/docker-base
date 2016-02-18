#!/bin/bash
set -eo pipefail

#Settings
SCRIPTS_PATH=/app/firstrun

if [ ! -e '/app/configured' ]; then
    # Run Backup Script
    while read FILE
    do
        NAME="${FILE##*/}"
        echo "#### Running first run script: $NAME"
        /bin/bash $FILE
    done < <( find $SCRIPTS_PATH/* -maxdepth 0 -type f )
    
    touch /app/configured
fi

exec "$@"