# download tlmgr and staticperl
wget -nc http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
wget -nc http://cvs.schmorp.de/App-Staticperl/bin/staticperl

# extract tlmgr and copy tlmgr.pl and its dependencies into the current directory
mkdir -p install-tl-unx
tar -xf install-tl-unx.tar.gz --strip-components=1 --directory=install-tl-unx
cp -r install-tl-unx/texmf-dist/scripts/texlive/tlmgr.pl install-tl-unx/tlpkg/TeXLive .

./staticperl mkapp app -v -M $PWD/tlmgr.pl --boot $PWD/tlmgr.pl -M Cwd -M File::Spec -M Pod::Usage -M Getopt::Long -M Digest::MD5 -M File::Temp -M File::Copy -M File::Glob \
    --add "$PWD/TeXLive/TLConfFile.pm TeXLive/TLConfFile.pm" \
    --add "$PWD/TeXLive/TLCrypto.pm TeXLive/TLCrypto.pm" \
    --add "$PWD/TeXLive/TLPDB.pm TeXLive/TLPDB.pm" \
    --add "$PWD/TeXLive/TLPSRC.pm TeXLive/TLPSRC.pm" \
    --add "$PWD/TeXLive/TLTREE.pm TeXLive/TLTREE.pm" \
    --add "$PWD/TeXLive/TLWinGoo.pm TeXLive/TLWinGoo.pm" \
    --add "$PWD/TeXLive/TLConfig.pm TeXLive/TLConfig.pm" \
    --add "$PWD/TeXLive/TLDownload.pm TeXLive/TLDownload.pm" \
    --add "$PWD/TeXLive/TLPOBJ.pm TeXLive/TLPOBJ.pm" \
    --add "$PWD/TeXLive/TLPaper.pm TeXLive/TLPaper.pm" \
    --add "$PWD/TeXLive/TLUtils.pm TeXLive/TLUtils.pm" \
    --add "$PWD/TeXLive/TeXCatalogue.pm TeXLive/TexCatalogue.pm"

./app
