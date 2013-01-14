# Copyright 2004-2011 Sabayon
# Distributed under the terms of the GNU General Public License v2

K_SABKERNEL_SELF_TARBALL_NAME="beaglebone"
K_REQUIRED_LINUX_FIRMWARE_VER="20111025"
K_SABKERNEL_FORCE_SUBLEVEL="0"
K_MKIMAGE_RAMDISK_ADDRESS="0x81000000"
K_MKIMAGE_RAMDISK_ENTRYPOINT="0x00000000"
inherit sabayon-kernel

KEYWORDS="~arm"
DESCRIPTION="Sabayon BeagleBone OMAP3 Linux Kernel and modules"
RESTRICT="mirror"
DEPEND="${DEPEND} app-arch/lzop"
