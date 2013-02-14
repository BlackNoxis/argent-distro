# Copyright 1999-2009 Sabayon Linux
# Distributed under the terms of the GNU General Public License v2
#

EAPI=3
inherit eutils kde4-base

DESCRIPTION="Sabayon Linux Official KDE Artwork"
HOMEPAGE="http://www.sabayon.org/"
SRC_URI="mirror://sabayon/${CATEGORY}/${PN}/${P}.tar.xz"
LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+ksplash"
RDEPEND=""

S="${WORKDIR}/${PN}"

src_configure() {
	einfo "nothing to configure"
}

src_compile() {
	einfo "nothing to compile"
}

src_install() {
	# KDM
	dodir ${KDEDIR}/share/apps/kdm/themes
	cd ${S}/kdm
	insinto ${KDEDIR}/share/apps/kdm/themes
	doins -r ./

	# Kwin
	dodir ${KDEDIR}/share/apps/aurorae/themes/
	cd ${S}/kwin
	insinto ${KDEDIR}/share/apps/aurorae/themes/
	doins -r ./

	# KSplash
	if use ksplash; then
		dodir ${KDEDIR}/share/apps/ksplash/Themes
		cd ${S}/ksplash
		insinto ${KDEDIR}/share/apps/ksplash/Themes
		doins -r ./
	fi
}

pkg_postinst()
{
	einfo "Clearing Plasma Wallpaper Cache"
	for i in /home/*; do
		rm -rf /home/$i/.kde4/cache-*/plasma-wallpapers/usr/share/backgrounds/sabayon*
	done
}
