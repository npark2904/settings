#!/bin/sh
rm -rf ~/db/tags
ctags -R $PWD && mv tags ~/db/

rm -rf ~/db/cscope.files ~/db/cscope.out
find $PWD \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -name '*.java' -o -name '*.JAVA' \) -print > ~/db/cscope.files
cscope -i ~/db/cscope.files && mv $PWD/cscope.out ~/db/
echo "---result---"
ls  ~/db/ | grep tags
ls   ~/db/ | grep cscope
