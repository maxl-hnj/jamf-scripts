#!/bin/bash

/System/Library/CoreServices/ManagedClient.app/Contents/Resources/createmobileaccount -nS $(ls -l /dev/console | awk '{ print $3 }')