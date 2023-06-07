#!/bin/bash

# this is not a comment that would get any marks

# we get our hostname from the hostname command
myhostname=$(hostname)

# we have all our data, time to plug it into our output template
cat <<EOF

Report, blah blah blah

info
----
hostname: $myhostname

EOF
