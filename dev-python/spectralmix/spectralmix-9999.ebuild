# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2} )

inherit distutils-r1 eutils flag-o-matic fortran-2 multilib toolchain-funcs versionator mercurial

DESCRIPTION="SpectralMix is a collection of spectral-projection related statistical methods implemented in Python."
HOMEPAGE="https://code.google.com/p/spectralmix/"
EHG_REPO_URI="http://${PN}.googlecode.com/hg/trunk"
KEYWORDS="~amd64 ~x86"
LICENSE="GNU GPL V3"
IUSE="test doc"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}
        >=dev-python/numpy-1.6.2-r2
        >=sci-libs/scipy-0.11.0-r1
	>=dev-python/pygraphviz-1.1-r1
	>=dev-python/networkx-1.6
	doc? ( app-doc/doxygen )"

DISTUTILS_IN_SOURCE_BUILD=1
