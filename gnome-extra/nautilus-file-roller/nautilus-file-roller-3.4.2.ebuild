# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

GNOME_ORG_MODULE="file-roller"
inherit eutils gnome.org

DESCRIPTION="Provides context menu for Nautilus"
HOMEPAGE="http://fileroller.sourceforge.net/"

LICENSE="GPL-2+"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux"

RDEPEND="
	~app-arch/file-roller-${PV}
	>=gnome-base/nautilus-3
"
DEPEND=">=gnome-base/nautilus-3
	>=dev-libs/glib-2.29.14:2
	sys-devel/gettext
	virtual/pkgconfig
	>=x11-libs/gtk+-3.0.2:3
"

src_configure() {
	# --disable-debug because enabling it adds -O0 to CFLAGS
	G2CONF="${G2CONF}
		--disable-dependency-tracking
		--disable-scrollkeeper
		--disable-run-in-place
		--disable-static
		--disable-schemas-compile
		--disable-debug
		--enable-magic
		--enable-nautilus-actions
		--disable-packagekit"
	econf $G2CONF
}

src_compile() {
	cd nautilus || die
	emake
}

src_install() {
	cd nautilus || die
	emake DESTDIR="${D}" install
	find "${D}" -name '*.la' -exec rm -f {} + || die "la file removal failed"
}
