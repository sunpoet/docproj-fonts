PORTNAME=	docproj-fonts-cjk
PORTVERSION=	20221224
CATEGORIES=	textproc chinese
MASTER_SITES=	https://github.com/googlefonts/noto-cjk/raw/Sans2.004/ \
		https://github.com/googlefonts/noto-cjk/raw/Sans2.004/Sans/SubsetOTF/JP/:jp \
		https://github.com/googlefonts/noto-cjk/raw/Sans2.004/Sans/SubsetOTF/KR/:kr \
		https://github.com/googlefonts/noto-cjk/raw/Sans2.004/Sans/SubsetOTF/SC/:sc \
		https://github.com/googlefonts/noto-cjk/raw/Sans2.004/Sans/SubsetOTF/TC/:tc
DISTFILES=	LICENSE \
		NotoSansJP-Regular.otf:jp \
		NotoSansKR-Regular.otf:kr \
		NotoSansSC-Regular.otf:sc \
		NotoSansTC-Regular.otf:tc
DIST_SUBDIR=	Noto/CJK/2.004
EXTRACT_ONLY=	# empty

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	CJK fonts required by the FreeBSD Documentation Project
WWW=		https://www.freebsd.org/docproj

LICENSE=	OFL11
LICENSE_FILE=	${DISTDIR}/${DIST_SUBDIR}/LICENSE

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	${DOCPROJ_FONTS:S|^|${DATADIR}/|}

DOCPROJ_FONTS=	NotoSansJP-Regular.otf \
		NotoSansKR-Regular.otf \
		NotoSansSC-Regular.otf \
		NotoSansTC-Regular.otf

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
	cd ${DISTDIR}/${DIST_SUBDIR} && ${INSTALL_DATA} ${DOCPROJ_FONTS} ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
