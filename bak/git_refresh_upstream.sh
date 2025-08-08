#!/bin/bash
#
# git_refresh_upstream.sh  v1.0
#

set -e

echo $0
echo "git status"
git status

./gpg_refresh.sh || exit 1

echo ""
git remote -v

echo ""
echo "Ready to update $(git branch --show-current) from $(git remote get-url origin)"
echo ""

#**************************************************************************************************
# Confirm we actually want to proceed to publish if there were missing example source files.
#**************************************************************************************************
REFRESH_CONTINUE=
until [ "${REFRESH_CONTINUE^}" == "Y" ] || [ "${REFRESH_CONTINUE^}" == "N" ]; do
    read -r -n1 -p "Proceed? (Y/N) " REFRESH_CONTINUE
    REFRESH_CONTINUE=${REFRESH_CONTINUE^};
    echo;
    sleep 0.5
done

if [ "${REFRESH_CONTINUE}" == "Y" ]; then
    echo "Continuing with refresh..."
else
    echo "Exiting..."
    exit 1
fi

echo""
echo "Enter a password for gpg as needed, otherwise git signing may kick an error..."
gpg -o /dev/null --status-fd=2 -bsau 305148B344E8E820  $0

echo ""
echo "git fetch"
git fetch

echo ""
echo "git pull"
git pull

echo ""
echo "git fetch upstream main"
git fetch upstream main

echo ""
echo "git pull upstream main"
git pull upstream main
