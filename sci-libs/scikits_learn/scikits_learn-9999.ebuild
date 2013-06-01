# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 git-2

MYPN="${PN/scikits_/scikit-}"

DESCRIPTION="Python modules for machine learning and data mining"
HOMEPAGE="http://scikit-learn.org"
EGIT_REPO_URI="git://github.com/scikit-learn/scikit-learn.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples test"

RDEPEND="
	sci-libs/scikits[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]"
DEPEND="
	dev-python/cython
	dev-python/setuptools[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}] )
	test? (
		dev-python/nose[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MYPN}-${PV}"

#python_prepare_all() {
#	# bug #397605
#	[[ ${CHOST} == *-darwin* ]] \
#		&& append-ldflags -bundle "-undefined dynamic_lookup" \
#		|| append-ldflags -shared
#
#	# scikits-learn now uses the horrible numpy.distutils automagic
#	export SCIPY_FCONFIG="config_fc --noopt --noarch"
#}

#python_compile() {
#	distutils-r1_python_compile ${SCIPY_FCONFIG}
#}

python_compile_all() {
	if use doc; then
		cd "${S}/doc"
		local d="${BUILD_DIR}"/lib
		ln -s "${S}"/sklearn/datasets/{data,descr,images} \
			"${d}"/sklearn/datasets
		VARTEXFONTS="${T}"/fonts \
			MPLCONFIGDIR="${BUILD_DIR}" \
			PYTHONPATH="${d}" \
			emake html
		rm -r "${d}"/sklearn/datasets/{data,desr,images}
	fi
}

python_test() {
	# doc builds and runs tests
	use doc && return
	esetup.py \
		install --root="${T}/test-${EPYTHON}" \
		--no-compile ${SCIPY_FCONFIG} || die
	cd "${T}/test-${EPYTHON}/${EPREFIX}$(python_get_sitedir)" || die

	if use test; then
		PYTHONPATH=. nosetests-${EPYTHON} sklearn --exe || die
	fi
}

python_install() {
	distutils-r1_python_install ${SCIPY_FCONFIG}
}

python_install_all() {
	find "${S}" -name \*LICENSE.txt -delete
	insinto /usr/share/doc/${PF}
	use doc && dohtml -r doc/_build/html
	use examples && doins -r examples
}
