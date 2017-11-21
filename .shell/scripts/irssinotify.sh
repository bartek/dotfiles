#!/bin/bash
 
(ssh admin@whahay.net -p1189 -o PermitLocalCommand=no \
    ": > .irssi/fnotify ; cat .irssi/fnotify " | \
    while read heading message; do \
        terminal-notifier -title "${heading}" -message "${message}"; \
    done)
