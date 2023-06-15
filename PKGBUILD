# Maintainer: Ákos Nádudvari <akos@nadudvari.org>

pkgname=fzt-repo-keyring
pkgver=20230615
pkgrel=1
pkgdesc='Keyring for repo.fzt.one packages'
arch=('any')
url='https:/github.com/akosnad/fzt-repo-keyring/'
license=('GPL3')
install=$pkgname.install
depends=('pacman')
makedepends=('git' 'make' 'bash' 'gnupg')
checkdepends=()
source=("local://Makefile" "local://build.sh")
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('DC6C238558CF0FC39400BA2EE2256EAE7390AF2C' # akosnad
)

prepare() {
    cp -ar ${startdir}/keyring ${srcdir}
}

build() {
    make build
}

check() {
    make check
}

package() {
    make PREFIX='/usr' DESTDIR="${pkgdir}" install
}

