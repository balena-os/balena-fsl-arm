#!/bin/sh
### BEGIN INIT INFO
# Provides: bluetooth-uart
# Required-Start:    $local_fs $syslog $remote_fs dbus
# Required-Stop:     $local_fs $syslog $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Attaching UART to Bluez stack
### END INIT INFO
#

DESC="sl-uart"
PATH="/sbin:/bin:/usr/sbin:/usr/bin"
HCIATTACH=$(command -v hciattach)
HCICONFIG=$(command -v hciconfig)
SL_ATTACH_CMD="$HCIATTACH -p /dev/ttymxc0 any 1000000 noflow"
SL_UART_DEVICE="/sys/class/tty/ttymxc0/"

# Check for required commands
if [ -z "$HCIATTACH" ] || [ -z "$HCICONFIG" ]; then
    echo "Error: Required commands not found. Please install bluez package."
    exit 1
fi

test -f /etc/default/bluetooth && . /etc/default/bluetooth

#. /lib/lsb/init-functions

set -e

start_sl()
{
    echo "Attaching SL Gecko module as HCI device..."
    $SL_ATTACH_CMD > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Failed to attach SL Gecko module as an HCI device."
        return 1
    fi
    
    # Wait briefly for the device to initialize
    sleep 1
    
     # Assign HCI interface name to a variable
    GECKO_HCI_IF=$(ls $SL_UART_DEVICE | grep 'hci')

    # Check if the variable is empty
    if [ -z "$GECKO_HCI_IF" ]; then
        echo "Error: HCI interface couldn't be identified for SL Gecko module."
        exit 1
    fi

    # Bring up the HCI interface
    echo "Bringing up $GECKO_HCI_IF"
    $HCICONFIG $GECKO_HCI_IF up
    if [ $? -ne 0 ]; then
        echo "Error: Failed to bring up $GECKO_HCI_IF"
    return 1
    fi
    
    return 0
}

stop_sl()
{
    HCIATTACH_PID=$(pgrep -f "$SL_ATTACH_CMD") 
    if [ -n "$HCIATTACH_PID" ]; then
        echo "Killing hciattach process for SL Gecko module"
        kill -9 $HCIATTACH_PID
    fi
}

check_status()
{
    HCIATTACH_PID=$(pgrep -f "$SL_ATTACH_CMD")
    if [ -n "$HCIATTACH_PID" ]; then
        echo "$DESC is running (PID: $HCIATTACH_PID)"
        $HCICONFIG | grep -A 2 "hci"
        return 0
    else
        echo "$DESC is not running"
        return 1
    fi
}

usage()
{
    echo "Usage: $0 {start|stop|restart|force-reload|status}"
    exit 1
}

case $1 in
    start)
        echo "Starting $DESC"
        if test "$BLUETOOTH_ENABLED" = 0 ; then
            echo "bluetooth disabled. see /etc/default/bluetooth"
            exit 0
        fi
  
        # Attach Gecko module as an HCI device over UART
        if ! start_sl; then
            echo "Error: Failed to start SL Gecko module."
            exit 1
        fi

        exit 0
    ;;

    stop)
        echo "Stopping $DESC"
        if test "$BLUETOOTH_ENABLED" = 0 ; then
            echo "bluetooth disabled. see /etc/default/bluetooth"
            exit 0
        fi

        stop_sl
        exit 0
    ;;

    restart|force-reload)
        $0 stop
        sleep 1
        $0 start
        exit 0;
    ;;

    status)
        check_status
        exit $?
    ;;

    *)
        usage
    ;;
esac

exit 0