#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

rm -f /etc/acpi/events/yoga-brightness-up
rm -f /etc/acpi/events/yoga-brightness-down
rm -f   /etc/acpi/events/yoga-brightness.sh

sudo service acpid reload
