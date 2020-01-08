#!/usr/bin/env bash
set -e
echo "Starting..."

CONSTRAINTS_FILE=/packaging/constraints.txt
REQUIREMENTS_FILE=/packaging/dev-requirements.txt

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi

if test -f ${CONSTRAINTS_FILE}
then
    echo "## /$CONSTRAINTS_FILE exist"
    wagon create . -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}''
else
    echo "## /$CONSTRAINTS_FILE doesn't exist"
    wagon create . -r $REQUIREMENTS_FILE -v -f
fi

cp -R * /workspace/build/
