# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2} )

inherit distutils-r1 eutils flag-o-matic multilib toolchain-funcs versionator

DOC_PV="${PV}"

DESCRIPTION="Read, modify and write DICOM files with python code"
HOMEPAGE="https://code.google.com/p/pydicom/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

RDEPEND=""
DEPEND="${RDEPEND}
    >=dev-lang/python-2.6"

python_install_all() {
    # Install the examples
    if use examples; then
        insinto /usr/share/doc/${PF}
        doins -r dicom/examples
    fi
}
