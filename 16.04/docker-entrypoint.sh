#!/bin/bash
set -eo pipefail

#Settings
FIRSTRUN_SCRIPTS_PATH=/app/firstrun
PRERUN_SCRIPTS_PATH=/app/prerun

if [ ! -e '/app/configured' ]; then
    # Run First Run Script
    while read FILE
    do
        NAME="${FILE##*/}"
        echo "#### Running first run script: $NAME"
        /bin/bash $FILE
    done < <( find $FIRSTRUN_SCRIPTS_PATH/* -maxdepth 0 -type f )
    
    touch /app/configured
fi

while read FILE
do
    NAME="${FILE##*/}"
    echo "#### Running pre-run script: $NAME"
    /bin/bash $FILE
done < <( find $PRERUN_SCRIPTS_PATH/* -maxdepth 0 -type f )

exec "$@"