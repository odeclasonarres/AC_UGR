#!/bin/bash

carpeta=$1
nombrejecutable=$2
iteraciones=$3
i=0
raiz=`pwd`

if [[ $# -lt 3 ]]
then
	echo "Error: introduce nombre de la carpeta, nombre del ejecutable, iteraciones y argumentos si fuesen necesarios"
	exit -1
fi

if [ -d ./$carpeta ] 
then
	echo "Error: la carpeta ya existe"
	exit -2
fi

if [ ! -x ./$nombrejecutable ] 
then
	echo "Error: el ejecutable no existe"
	exit -3
fi

mkdir $carpeta
cp $nombrejecutable $carpeta
cd $carpeta

while [  $i -lt $iteraciones ]; do
	if [[ `qstat | wc -l` -lt 6 ]]
	then		
		echo $raiz/$carpeta/$nombrejecutable $4 $5 $6 $7 $8 $9 $10 $11 $12 | qsub -q ac
		let i=i+1 
	
	else
		sleep 2
	fi
done

while [[ `qstat | wc -l` != 0 ]]; do
	sleep 2
done

#esta parte dependerá del ejecutable (parte no parametrizable)
cat STDIN.o* | cut -c 14-25 | sort > media 
rm STDIN*
rm $nombrejecutable
clear
cat media





