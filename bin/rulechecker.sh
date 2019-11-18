if [ -e "CodeAnalyzer.jar" ]
then
rm CodeAnalyzer.jar
fi
wget http://atos-storage.lge.net:8080/results/rulechecker/CodeAnalyzer.jar --no-check-certificate &>/dev/null
java -jar CodeAnalyzer.jar "$1" "$2" "$3" "$4" "$5"
