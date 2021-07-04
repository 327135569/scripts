set -e


abort() {
	echo "$1"
	exit 1
}

[ ! -f "magiskboot" ] && abort "No magiskboot"

[ ! -f "Image.gz-dtb" ] && abort "No Image.gz-dtb"

[ ! -f "boot.img" ] && abort "No boot.img"

rm -rf flashkernel_out
mkdir flashkernel_out 
cd flashkernel_out

../magiskboot unpack ../boot.img
ls -la

../magiskboot split ../Image.gz-dtb
ls -la

../magiskboot repack ../boot.img

