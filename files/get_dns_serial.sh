#!/bin/bash

################################################################################
#                                                                              #
#                                 {o,o}                                        #
#                                 |)__)                                        #
#                                 -"-"-                                        #
#                                                                              #
################################################################################
#
# Get an appropriate serial for the zones.
#
#################################---ENV---######################################

SERIAL="$(date +%Y%m%d)01"
if [ -d "/etc/bind/master" ]
then
  ZONE_DIR="/etc/bind/master"
elif [ -d "/etc/named/master" ]
then
  ZONE_DIR="/etc/named/master"
else
  echo "ERROR: No bind directory found."
  exit 1
fi

################################################################################

##############################---FUNCTIONS---###################################

function getSerial(){
  current_serial=$(grep -R -E "[[:digit:]]{10} \; serial" -h ${ZONE_DIR} -o | cut -d " " -f 1 | sort | tail -n1)
  if [ ${SERIAL} -gt ${current_serial} ]
  then
    echo -n ${SERIAL}
  else
    echo -n $(expr ${current_serial} + 1)
  fi
}

################################################################################

###############################---EXECUTION---##################################

getSerial

################################################################################
