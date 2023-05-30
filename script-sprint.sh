#!/bin/bash

sudo apt-get update && sudo apt-get upgrade #atualiza o ambiente

-Y

cd ..
sleep 2
cd Jar-Docker

if [ $? = 0 ]; #se retorno for igual a 0
	then #entao,
		git clone https://github.com/didiegovieira/Jar-Docker.git
		cd Jar-Docker/jar-individual/target
		java -jar jar-individual-1.0-SNAPSHOT-jar-with-dependencies.jar

	else #se nao,
		git fetch && git pull
		cd jar-individual/jar-individual/target
		java -jar jar-individual-1.0-SNAPSHOT-jar-with-dependencies.jar

fi #fecha o 1o if

