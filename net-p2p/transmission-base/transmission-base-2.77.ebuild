# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
TRANSMISSION_ECLASS_VERSION_OK=2.76
inherit transmission-2.76

DESCRIPTION="A Fast, Easy and Free BitTorrent client - base files"
KEYWORDS="~amd64 ~x86"
IUSE="lightweight xfs"

DEPEND="xfs? ( sys-fs/xfsprogs )"

DOCS="AUTHORS NEWS"

src_install() {
	default
	rm "${ED}"/usr/share/${MY_PN}/web/LICENSE || die

	keepdir /var/{${MY_PN}/{config,downloads},log/${MY_PN}}
	fowners -R ${MY_PN}:${MY_PN} /var/{${MY_PN}/{,config,downloads},log/${MY_PN}}
	dolib.a "${S}/libtransmission/libtransmission.a"
}
