#!/usr/bin/env bash

# colours
WHITE='\033[1;37m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NONE='\033[0m'

# general
ASCII="$(figlet hayate | tr -d '\000')"
HARDWARE="$(cat /sys/firmware/devicetree/base/model | tr -d '\000')"
CPU_TEMP="$(vcgencmd measure_temp | tr -cd '[[:digit:]].' | tr -d '\000')"

# temperature check script
temperature_check() {
if [ ${CPU_TEMP%.*} -ge 80 ]; then
  echo "$WHITE"
elif [ ${CPU_TEMP%.*} -ge 70 ]; then
  echo "$RED"
elif [ ${CPU_TEMP%.*} -ge 50 ]; then
  echo "$YELLOW"
else
  echo "$GREEN"
fi
}

# what the user is shown
printf "$ASCII\n"
printf "Welcome to Hayate! Below are some useful stats for this server.\n"
printf "Hardware: $HARDWARE\n"
printf "RAM: 4 GB\n"
printf "Temperature:$(temperature_check) $CPU_TEMP C$NONE\n"
