#!/bin/bash
####################################################################################################
# Extension Attribute - MDM Communication Status
#
# Checks whether the Mac is successfully communicating with the MDM server.
# It does this by scanning the system log for MDM identity errors in the last 24 hours.
#
# Returns:
#   - "MDM is communicating" if no errors are found
#   - "MDM is broken" if MDM identity errors are detected
####################################################################################################
result=$(log show --style compact --predicate '(process CONTAINS "mdmclient")' --last 1d | grep "Unable to create MDM identity")

if [[ $result == '' ]]
then
    echo "<result>MDM is communicating</result>"
else
    echo "<result>MDM is broken</result>"
fi
