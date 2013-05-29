# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/numpy/numpy-1.7.0.ebuild,v 1.1 2013/02/19 20:17:2$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2} )

inherit distutils-r1 eutils flag-o-matic fortran-2 multilib toolchain-funcs versionator

DOC_PV="${PV}"

DESCRIPTION="glumpy is a small python library for the rapid vizualization of numpy arrays, (mainly two dimensional) that has been designed with efficiency in mind."
HOMEPAGE="https://code.google.com/p/glumpy/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="demos"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

DISTUTILS_IN_SOURCE_BUILD=1

