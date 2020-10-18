#/bin/bash

#Exemplos de for

# 1° forma

for i in {1..10}
do
	#comandos
	echo "$i"
done

# 2° forma

for i in $(seq 1 10)
do
	#comandos
	echo "$i"
done

# 3° forma parecido com js/C/C# (Funciona apenas com bash(?))

#for i in ((i=0; i -le 5; i++))
#do
	#comandos
#	echo "$i"
#done

# Exemplos de while

while [ true ]
do
	echo "While infinito aq não"
	break
done
