#!/bin/bash

echo "Waiting for JLuping installation to be completed"; while [ ! -f /opt/.backgroundfinished ] ; do sleep 2; done; echo "Done"
