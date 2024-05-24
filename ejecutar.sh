rm date_converter.tab* lex.yy.c converter output.txt


bison -d date_converter.y
flex date_converter.l
gcc date_converter.tab.c lex.yy.c -o converter -lfl

./converter < input.txt > output.txt
echo "Este es el archivo inicial (ISO 8601)"
cat input.txt

echo "Este es el archivo final (iCall)"
cat output.txt



