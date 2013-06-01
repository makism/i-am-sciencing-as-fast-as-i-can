# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils flag-o-matic multilib toolchain-funcs versionator

DESCRIPTION="A python package for analysis of neuroimaging data"
HOMEPAGE="http://nipy.org/nipy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
DEPENDS=">=dev-lang/python-2.5[$USE_PYTHON]
        >=dev-python/numy-1.2[${PYTHON_USEDEP}]
        >=sci-libs/scipy-0.7.0[${PYTHON_USEDEP}]
        >=dev-python/sympy-0.6.6[${PYTHON_USEDEP}]
	>=sci-libs/nibabel-1.3.0[${PYTHON_USEDEP}]"
KEYWORDS="~amd64 ~x86"

python_prepare_all() {
	append-ldflags -shared
}
