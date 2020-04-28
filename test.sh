#!/bin/bash

if (docker run --rm --name kubectl kubectl | grep -E "kubectl controls the Kubernetes cluster manager."); then
	echo "OK"
else
	echo "FAIL"
	exit 1
fi
