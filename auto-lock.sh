#!/bin/bash

function prntdbg {
  if [ ! -z "$DEBUG" ]; then
    echo "$@"
  fi
}

function lock_screen {
  prntdbg 'go to sleep'
  pmset displaysleepnow
}

function wait_for_plugin {
  while true; do
    if system_profiler SPUSBDataType | grep 'YubiKey' 2>/dev/null >/dev/null; then
      prntdbg 'yubikey plugged in'
      break
    else
      prntdbg 'yubikey removed'
    fi
    sleep 2
  done
}

function wait_for_unplug {
  while true; do
    if system_profiler SPUSBDataType | grep 'YubiKey' 2>/dev/null >/dev/null; then
      prntdbg yubikey plugged in
    else
      prntdbg 'yubikey removed'
      lock_screen
      break
    fi
    sleep 2
  done
}

while true; do
  if system_profiler SPUSBDataType | grep 'YubiKey' 2>/dev/null >/dev/null; then
    prntdbg 'yubikey was found, sleep upon removal'
    while true; do
      wait_for_plugin
      wait_for_unplug
    done
  else
    prntdbg 'yubikey not found, check again in a few sec'
  fi
  sleep 3
done