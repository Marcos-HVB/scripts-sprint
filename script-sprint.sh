#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y #atualiza o ambiente

cd ..
sleep 2

diretorio="Jar-Docker"

if [ -d "$diretorio" ]; #se retorno for igual a 0
	then #entao,
		cd Jar-Docker
		git pull
		cd jar-individual/target
		java -jar EasyWare.jar
	else #se nao,root
		git clone https://github.com/didiegovieira/Jar-Docker.git
		cd Jar-Docker/jar-individual/target
		java -jar EasyWare.jar

fi #fecha o 1o if

