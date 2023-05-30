#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y #atualiza o ambiente

cd ..
sleep 2

diretorio="Jar-Docker"
echo -d "$diretorio veriricando se existe"
if [ -d "$diretorio" ]; #se retorno for igual a 0
	then #entao,
		echo "travei no then"
		
		git pull
		cd Jar-Docker/jar-individual/target
		java -jar jar-individual-1.0-SNAPSHOT-jar-with-dependencies.jar
	else #se nao,root
		echo "travei no else"
		git clone https://github.com/didiegovieira/Jar-Docker.git
		cd Jar-Docker/jar-individual/target
		java -jar jar-individual-1.0-SNAPSHOT-jar-with-dependencies.jar

fi #fecha o 1o if

