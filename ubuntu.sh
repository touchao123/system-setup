#!/bin/bash
#
# Ubuntu Setup
#
source functions.sh

echo "************************************************"
echo "***    Welcome to the Ubuntu System Setup    ***"
echo "************************************************"
echo ""

if [ $# -eq 0 ]; then
    echo "Default entry: automatically_install_all"
    automatically_install_all
else
    echo "Invoking: $1"
    "$@"
fi

echo ""
echo "************************************************"
echo "***    Finished, now run ./post-install      ***"
echo "************************************************"
