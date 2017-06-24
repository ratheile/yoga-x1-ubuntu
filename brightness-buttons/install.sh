#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

rm -f /etc/acpi/events/yoga-brightness-up
rm -f /etc/acpi/events/yoga-brightness-down
rm -f   /etc/acpi/yoga-brightness.sh

cp ./yoga-brightness-up  /etc/acpi/events/yoga-brightness-up
cp ./yoga-brightness-down  /etc/acpi/events/yoga-brightness-down
cp ./yoga-brightness.sh  /etc/acpi/yoga-brightness.sh

chmod a+rx /etc/acpi/yoga-brightness.sh

sudo service acpid reload
