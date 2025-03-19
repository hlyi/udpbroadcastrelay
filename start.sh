#!/bin/sh
echo "============== IP Info ===========+=="
ip addr
echo "-------------- Starting -------------"
if [ "$CMDOPTS" = "" ]; then
	echo "ERROR: Missing CMDOPTS environment variable"
	exit 1;
else
	cmd="/udpbroadcastrelay $CMDOPTS"
	echo $cmd
	$cmd
fi
