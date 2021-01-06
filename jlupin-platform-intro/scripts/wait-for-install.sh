#!/bin/bash

echo "Waiting for JLupin installation to be completed"; while [ ! -f /opt/.backgroundfinished ] ; do sleep 2; done; echo "Done"
