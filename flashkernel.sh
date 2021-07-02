set -e


abort() {
	echo "$1"
	exit 1
}

[ ! -f "magiskboot" ] && abort "No magiskboot"

[ ! -f "Image.gz-dtb" ] && abort "No Image.gz-dtb"

[ ! -f "boot.img" ] && abort "No boot.img"

rm -rf xxx
mkdir xxx 
cd xxx

../magiskboot unpack ../boot.img
ls -la

../magiskboot split ../Image.gz-dtb
ls -la

../magiskboot repack ../boot.img

