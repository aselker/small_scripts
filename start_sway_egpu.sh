#!/bin/sh

if [ -e "/dev/dri/card1" ]; then
  echo "Probable eGPU detected"
  if [ ! -z "$(udevadm info -a -n /dev/dri/card0 | grep i915)" ]; then
    intel="/dev/dri/card0"
    nvidia="/dev/dri/card1"
  else
    intel="/dev/dri/card1"
    nvidia="/dev/dri/card0"
  fi
  # SWAY_EGPU is to indicate to another script that it should setup the outputs the way I like.
  # SWAY_EGPU=1 WLR_NO_HARDWARE_CURSORS=1 WLR_DRM_DEVICES="${nvidia}:${intel}" sway
  SWAY_EGPU=1 WLR_DRM_DEVICES="${nvidia}:${intel}" sway
else
  echo "No eGPU detected"
  # WLR_NO_HARDWARE_CURSORS=1 sway
  # sway
fi
