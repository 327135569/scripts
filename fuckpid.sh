set -e

PKGNAME="$1"

usage() {
    echo "Usage: "
    echo ""
    echo "./fuckpid.sh <process name>"
    echo ""
    exit 1
}

abort() {
    echo "$1"
    exit 1
}

[ -z "$1" ] && usage

echo "Package name: $PKGNAME"

PID=$(adb shell ps | grep -e $PKGNAME$ | awk '{print $2}')

[ -z "$PID" ] && abort "Can't find process: $PKGNAME"

echo "Find $PKGNAME PID: $PID"

JDWP_PORT=1234
GDB_PORT=1235
echo "Forward remote port to Local port"

adb forward tcp:$JDWP_PORT jdwp:$PID
adb forward tcp:$GDB_PORT tcp:$GDB_PORT

echo "Attach PID: $PID"

adb shell su -c "killall -9 lldb-server && /data/local/tmp/lldb-server g --attach $PID :$GDB_PORT"

echo 'Exit.'

