#!/bin/bash
echo""
echo "Enter a password for gpg as needed, otherwise git signing may kick an error..."
gpg -o /dev/null --status-fd=2 -bsau 305148B344E8E820  $0
