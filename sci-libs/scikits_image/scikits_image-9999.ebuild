# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/scikits_image/scikits_image-0.8.2.ebuild,v 1.1 2013/03/19 20:31:15 bicatali Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 git-2

MYPN="${PN/scikits_/scikit-}"

DESCRIPTION="Image processing routines for SciPy"
HOMEPAGE="http://scikit-image.org/"
EGIT_REPO_URI="git://github.com/scikit-image/scikit-image.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc freeimage gtk qt4 test"

RDEPEND="
	sci-libs/scikits[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	freeimage? ( media-libs/freeimage )
	gtk? ( dev-python/pygtk[${PYTHON_USEDEP}] )
	qt4? ( dev-python/PyQt4[${PYTHON_USEDEP}] )"
DEPEND="
	>=dev-python/cython-0.15[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.6[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pyamg[${PYTHON_USEDEP}]
		sci-libs/scipy[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MYPN}-${PV}"

DOCS=( CONTRIBUTORS.txt CONTRIBUTING.txt DEPENDS.txt RELEASE.txt TASKS.txt )

python_test() {
	esetup.py \
		install --root="${T}/test-${EPYTHON}" \
		--no-compile || die "install test failed"
	cd "${T}/test-${EPYTHON}/$(python_get_sitedir)" || die
	echo "backend: Agg" > matplotlibrc
	MPLCONFIGDIR=. PYTHONPATH=. nosetests-"${EPYTHON}" || die
}
