#!/bin/bash

if lsmod | grep -q acpi_call; then
    echo "\_SB.PCI0.PEG0.PEGP._OFF" >/proc/acpi/call
    result=$(cat /proc/acpi/call)
    case "$result" in
        Error*)
            echo "failed" >>/home/calin/turn_off_gpu.out
        ;;
        *)
            echo "works!" >>/home/calin/turn_off_gpu.out
            # break # try out outher methods too
        ;;
    esac
else
    echo "The acpi_call module is not loaded, try running 'modprobe acpi_call'\
 or 'insmod acpi_call.ko' as root" >>/home/calin/turn_off_gpu.out
    exit 1
fi
