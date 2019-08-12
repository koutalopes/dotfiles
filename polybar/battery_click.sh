#!/bin/bash

str=$(acpi -b)

notify-send "$(echo -e ${str:10})"
