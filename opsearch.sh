#!/bin/bash

# opsearch.sh - A script to search for items in One Password vault using onepassword CLI

while getopts "nv" flag; do
	case "${flag}" in
		# Use this flag to search for a note
		n) SEARCH_NOTE='true' ;;
		v) verbose='true' ;;
	esac
done

if [ -z "${!#}" ]; then
	echo "Error: No name provided. Please provide a name to search for."
	exit 1
fi

if [ $SEARCH_NOTE ]; then
	# Search for notes in the vault
	if [ "$verbose" ]; then
		echo "Verbose mode enabled."
		echo "Searching for note: ${!#}"
	fi

	op item get "${!#}" --fields notesPlain
	exit 0
fi
