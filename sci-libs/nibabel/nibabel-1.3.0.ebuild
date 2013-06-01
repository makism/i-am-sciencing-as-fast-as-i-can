# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils flag-o-matic multilib toolchain-funcs versionator

DESCRIPTION="Access a multitude of neuroimaging data formats."
HOMEPAGE="http://nipy.org/nibabel"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"
DEPENDS=">=dev-lang/python-2.5
        >=dev-python/numy-1.2[${PYTHON_USEDEP}]
        >=sci-libs/scipy-0.7.0[${PYTHON_USEDEP}]
        >=dev-python/sympy-0.6.6[${PYTHON_USEDEP}]
        dev-python/pydicom[${PYTHON_USEDEP}]
        dev-python/imaging[${PYTHON_USEDEP}]
        test? ( dev-python/nose[${PYTHON_USEDEP}] )
        doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

