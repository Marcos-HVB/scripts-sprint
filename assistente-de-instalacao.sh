#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá Aluno, serei seu assistente para instalação do Java!;"
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Verificando aqui se você possui o Java instalado...;"
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o java instalado!!!"
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (S/N)?"
	read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java ;D"
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Adicionando o repositório!"
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt-get update -y
			clear

			sudo apt install openjdk-17-jdk -y

			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado ;D"
					sudo apt install default-jre ; apt install openjdk-17-jre-headless; -y
					clear
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Java instalado com sucesso!"
				fi
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima então!"
	fi
fi


docker --version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o Docker instalado!!!"
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Docker instalado, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Docker (S/N)?"
	read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Docker ;D"
			sleep 2
			sudo apt update && sudo apt upgrade –y
			clear
			sudo apt install docker.io -y
			clear
			sudo systemctl start docker
			clear
			sudo systemctl enable docker
			clear 
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt update -y
			clear
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Docker por enquanto, até a próxima então!"
	fi
fi



sudo docker images
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o Container criado!!!"
		sudo docker start BancoLocalEasy
		
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhum container, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja criar um container (S/N)?"
	read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu criar um container;D"
			sleep 2
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Criando Container com o MySQL."
			sleep 2
			sudo docker pull mysql:8.0
			clear 
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt update -y
			clear
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não ciar o container por enquanto, até a próxima então!"
	fi
fi




criacaoBanco="mysql -u root -purubu100 <<EOF
			use bd-projeto-easy;

			CREATE TABLE if not exists log_uso (
				id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
				id_maquina INT NOT NULL,
				id_empresa INT NOT NULL,
				id_usuario INT NOT NULL,
				data_log DATE NULL,
				hora_inicio TIME NULL,
				hora_fim TIME NULL
			);


			CREATE TABLE if not exists registro (
				id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
				clock_cpu DECIMAL(5 , 2 ) NULL,
				temp_cpu DECIMAL(5 , 2 ) NULL,
				uso_cpu DECIMAL(5 , 2 ) NULL,
				download_rede BIGINT NULL,
				upload_rede BIGINT NULL,
				uso DECIMAL(7,2),
				data_hora DATETIME
			);

			CREATE TABLE if not exists rede(
				id INT PRIMARY KEY auto_increment NOT NULL,
				ip varchar(20),
				driver varchar(45),
				nome varchar(45)
			);
			
EOF"


sudo docker-compose --version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você já tem o Banco criado!!!"
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Acessando container MySQL."
			sudo docker exec -it BancoLocalEasy bash -c "$criacaoBanco"
		
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhum banco, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja criar um banco (S/N)?"
	read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu criar um banco ;D"
			sleep 2
			sudo apt install docker-compose -y
			sleep 2
			sudo docker-compose up -d
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Acessando container MySQL."
			sudo docker exec -it BancoLocalEasy bash -c "$criacaoBanco"
			
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não ciar o banco por enquanto, até a próxima então!"
	fi
fi


chmod -x script-sprint.sh

bash script-sprint.sh














