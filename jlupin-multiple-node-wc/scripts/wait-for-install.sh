#!/bin/bash

# TODO: "quiet" mode
echo "Installing system dependencies"; while [ ! -f /opt/.sys-dep-install ] ; do sleep 2; done; echo "Done!"
echo "Downloading jlupin"; while [ ! -f /opt/.jlupin-download ] ; do sleep 2; done; echo "Done!"
echo "Setting up 1st jlupin node"; while [ ! -f /opt/.jlupin1-done ] ; do sleep 2; done; echo "Done!"
echo "Setting up 2nd jlupin node"; while [ ! -f /opt/.jlupin2-done ] ; do sleep 2; done; echo "Done!"
# echo "Starting 1st jlupin node"; while [ ! -f /opt/.jlupin1-start ] ; do sleep 2; done; echo "Done!"
# echo "Starting 2nd jlupin node"; while [ ! -f /opt/.jlupin2-start ] ; do sleep 2; done; echo "Done!"
echo "Starting jlupin nodes"; while [ ! -f /opt/.setup-finish ] ; do sleep 2; done; echo "Setup finished!"
