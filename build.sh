#!/usr/bin/env sh

pandoc --output header.html header.md

pandoc --output index.html \
       -B header.html \
       --css style.css \
       --standalone \
       --toc \
       --metadata title="The Iacchus' Table Markup Language - ITML-Lang" \
       README.md

