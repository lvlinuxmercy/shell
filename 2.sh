[ -d /456 ] || mkdir /456
cp /123/*.txt /456
find /123/ -type f -name "*.txt" |xargs -i mv {} {}.bak
tar -zcvf 123.tar.gz /123/*.txt.bak
rm -rf /123/*.txt.bak
