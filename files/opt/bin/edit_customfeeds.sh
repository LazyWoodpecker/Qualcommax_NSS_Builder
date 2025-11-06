#!/bin/sh

# HOST and DIR are the values configured in the customfeeds.conf file.
# NEWHOST and NEWDIR are the values we want HOST and DIR to be.
# Edit NEWHOST and NEWDIR as appropriate.

trap '/bin/rm -f $NEW' 0 1 2 3 15

HOST="fred.lan"
DIR="2025-08"

NEWHOST="192.168.69.174"
NEWDIR="2025-10"

ORIG=/etc/opkg/customfeeds.conf
NEW=${ORIG}.new

sed -e '1,$'"s/$HOST/$NEWHOST/" -e '1,$'"s/$DIR/$NEWDIR/" $ORIG > $NEW
mv $NEW $ORIG
