#!/bin/bash

sleep 5
if ! nordvpn status | grep -q "Connected"; then
    nordvpn connect
fi
