#!/bin/sh

if [ $(cat /sys/class/thermal/thermal_zone9/temp) -gt 80000 ]; then
    echo "hot"
  elif [ $(cat /sys/class/thermal/thermal_zone9/temp) -gt 60000 ]; then
    echo "normal"
  elif [ $(cat /sys/class/thermal/thermal_zone9/temp) -gt 50000 ]; then
    echo "cool"
  else
    echo "cold"
fi
