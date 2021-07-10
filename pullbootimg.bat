adb shell su -c "dd if=/dev/block/by-name/boot of=/sdcard/myboot.img"
adb pull /sdcard/myboot.img boot.img
