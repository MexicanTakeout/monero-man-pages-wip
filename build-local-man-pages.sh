#! /usr/bin/bash
if [[ "$EUID" != 0 ]]; then
    echo "Require sudo"
    exit 1
fi

if ! pandoc -v; then
    echo "pandoc is missing from your machine, please install"
    exit 1
fi

files=monero*reference.md

for f in $files
do
    manf=${f/-reference.md/.1}
    out=/usr/local/man/man1/$(basename $manf)

    # <br /> is removed from man page output, so we use \n|| as a pattern for new line
    sed -i -e 's/\s*<br.*>\s*/|| /g' $f
    sed -i -e 's/\n| /\n||\n /g' $f
    # sed -i -e 's/|| /\n|| /g' $f

    pandoc $f -s -t man -o $manf
    
    sed -i -e 's/lw(.*) lw(.*)/l lx/g' $manf # full width table format

    echo  $manf "** copying to MANPATH"
    # cp -f $manf $(basename $manf) # outputs useful for debugging
    cp -f $manf $out
    gzip -f $out
done

echo "** Running mandb"
mandb