#!/bin/bash
# Instalador do myzap2.0
# Autor: Só mais um, rapaz comum!
# Versao: 0.1

	whiptail=$(which whiptail) ; [[ -z $whiptail ]] && { echo "Whiptail não instalado, instale!" ; exit ; }
    id='4140b915846d03d051010291a7fa1f0d8822efa';
	function msg() {
		msg=$1
		whiptail --title "Instalacao API MYZAP" --msgbox "$msg" --fb 10 70;
	}

	function msg1() {
		msg1=$1
		whiptail --title "FIM Instalacao API MYZAP" --msgbox "$msg1" --fb 10 70;
	}



	whiptail --title "Instalacao API MYZAP" --msgbox "Instalador automatico MYZAP. Aperte ENTER para iniciar a instalacao" --fb 10 70
	[[ $(whoami) != 'root' ]] && {
		whiptail --title "Para continuar a instalacao, logue-se como ROOT" --msgbox "comando: su" --fb 10 70
		exit;
	}

		while true ; do
		telefone=$(whiptail --title "Informe seu Melhor Whatsapp" --inputbox "INforme o Whatsapp para Receber os dados da API: EX:55+DDD+NUMERO : " --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $telefone ]] ; then msg "Informe seu Melhor Whatsapp para proseguir" ; continue ; else break; fi
		else
			echo "saindo..." ; exit ;
		fi
	done


	pasta=$(whiptail --title "Informe a PASTA de intalação" --inputbox "Pressione ENTER para usar a pasta: MYZAP, ou digite uma pasta:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then if [[ -z $pasta ]] ; then pasta=MYZAP ; fi else echo "saindo..." ; exit ; fi

	porta=$(whiptail --title "Defina a PORTA para a API" --inputbox "Pressione ENTER para usar a porta: 3333, ou digite uma porta:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then if [[ -z $porta ]] ; then porta=3333 ; fi else echo "saindo..." ; exit ; fi


	  host=$(whiptail --title "Informe o Host para a API" --inputbox "digite o IP da VPS:" --fb 10 60 3>&1 1>&2 2>&3) saida=$?
    if [ $saida = 0 ]; then
       echo "O nome digitado foi: $host"
    else echo "saindo..." ; exit ; fi


	while true ; do
		token=$(whiptail --title "Defina um CODIGO TOKEN para a API" --inputbox "Digite o valor:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $token ]] ; then msg "Digite um valor para CODIGO TOKEN" ; continue ; else break; fi
		else
			echo $token ; echo "saindo..." ; exit ;
		fi
	done


	engine=$(whiptail --title "Escolha qual ENGINE ira usar" --menu "Escolha uma opcao na lista abaixo" --fb 15 60 4 \
	"1" "Whatsapp-WEB-JS" \
	"2" "WPPConnect" \
	"3" "Venom" 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -ne '0' ]] ; then echo "saindo..." ; exit ; fi

	while true ; do
		api_key=$(whiptail --title "CREDENCIAS DE ACESSO AO FIREBASE" --inputbox "Defina o valor para API_KEY:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $api_key ]] ; then msg "Digite um valor para API_KEY" ; continue ; else break; fi
		else
			echo "saindo..." ; exit ;
		fi
	done

	while true ; do
		auth_domain=$(whiptail --title "CREDENCIAS DE ACESSO AO FIREBASE" --inputbox "Defina o valor para AUTH_DOMAIN:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $auth_domain ]] ; then msg "Digite um valor para AUTH_DOMAIN" ; continue ; else break; fi
		else
			echo "saindo..." ; exit ;
		fi
	done

	while true ; do
		project_id=$(whiptail --title "CREDENCIAS DE ACESSO AO FIREBASE" --inputbox "Defina o valor para PROJECT_ID:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $project_id ]] ; then msg "Digite um valor para PROJECT_ID" ; continue ; else break; fi
		else
			echo "saindo..." ; exit ;
		fi
	done

	while true ; do
		storage_bucket=$(whiptail --title "CREDENCIAS DE ACESSO AO FIREBASE" --inputbox "Defina o valor para STORAGE_BUCKET:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $storage_bucket ]] ; then msg "Digite um valor para STORAGE_BUCKET" ; continue ; else break; fi
		else
			echo "saindo..." ; exit ;
		fi
	done

	while true ; do
		messaging_sender_id=$(whiptail --title "CREDENCIAS DE ACESSO AO FIREBASE" --inputbox "Defina o valor para MESSAGING_SENDER_ID:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $messaging_sender_id ]] ; then msg "Digite um valor para MESSAGING_SENDER_ID" ; continue ; else break; fi
		else
			echo "saindo..." ; exit ;
		fi
	done

	while true ; do
		app_id=$(whiptail --title "CREDENCIAS DE ACESSO AO FIREBASE" --inputbox "Defina o valor para APP_ID:" --fb 12 60 3>&1 1>&2 2>&3) ; saida=$?
		if [[ $saida -eq '0' ]] ; then
			if [[ -z $app_id ]] ; then msg "Digite um valor para APP_ID" ; continue ; else break; fi
		else
			echo "saindo..." ; exit ;
		fi
	done

	msg "A instalação já vai começa!";
rm -rf google-chrome-stable_current_amd64.deb
sudo apt install -y curl nano git gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget build-essential apt-transport-https libgbm-dev
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
dpkg -i ./google-chrome-stable_current_amd64.deb
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt -y install nodejs

git clone https://github.com/billbarsch/myzap ./${pasta}/
#git clone https://github.com/edupoli/MyZap2.0 ./${pasta}/
cd ./${pasta}

npm install --allow-root --unsafe-perm=true
#rm -R node_modules
#npm install --unsafe-perm=true --allow-root
npm update @wppconnect-team/wppconnect --force
npm update @wppconnect/wa-version --force
npm update @wppconnect/wa-js --force

cp .env_exemplo .env

sed -i "/^PORT/s/.*/PORT=$porta/" .env
sed -i "19s/HOST=http://localhost/HOST=http://$host/" .env
sed -i "/^TOKEN/s/.*/TOKEN=$token/" .env
sed -i "/^ENGINE/s/.*/ENGINE=$engine/" .env
sed -i "/^API_KEY/s/.*/API_KEY=$api_key/" .env
sed -i "/^AUTH_DOMAIN/s/.*/AUTH_DOMAIN=$auth_domain/" .env
sed -i "/^PROJECT_ID/s/.*/PROJECT_ID=$project_id/" .env
sed -i "/^STORAGE_BUCKET/s/.*/STORAGE_BUCKET=$storage_bucket/" .env
sed -i "/^MESSAGING_SENDER_ID/s/.*/MESSAGING_SENDER_ID=$messaging_sender_id/" .env
sed -i "/^APP_ID/s/.*/APP_ID=$app_id/" .env

cd ~ && cd ./${pasta}

npm install -y -g npm@latest pm2
pm2 start index.js --name API_${pasta}
pm2 startup
pm2 save

#curl --location --request POST 'https://api.owenbrasil.com/rest/send.php' \
#--header 'Cookie: PHPSESSID=58eab217966e93a8e491bc05cca4dde5' \
#--form 'type="text"' \
#--form 'token="'${id}'"' \
#--form 'numero="'${telefone}'"' \
#--form 'msg="*Owen Brasil:* \nSeja bem vindo(a), \nSua instalação *MyZap* Finalizou! \nAgora Acesse: '${host}:${porta}'/start e gere seu QrCode!"'


#curl --location --request POST 'https://api.owenbrasil.com/rest/send.php' \
#--header 'Cookie: PHPSESSID=58eab217966e93a8e491bc05cca4dde5' \
#--form 'type="text"' \
#--form 'token="'${id}'"' \
#--form 'numero="'${telefone}'"' \
#--form 'msg="Opa! já conhece a API WhatsApp da Owen?

#Utilizando Nossa API, você se integrar facilmente ao seu sistema, site e/ou projeto! o envio *automatizado* de mensagens para seus clientes via *WhatsApp*, existem diversas possibilidades de envios automáticos, os mais comuns são:
#
#- Agendamento;
#- Cobrança;
#- Promoções / Marketing;
#
#Estamos integrados a diversas soluções como; *ZABBIX + GRAFANA*, *MK-AUTH*, *SGP*, *MIKROTIK*, *RBFULL*, *ISPFY*, *IXC* & *Varios outros*!
##
#*Precisa integrar ao seu Sistema ou ERP/CRM?* Chame o nosso suporte, Ficaremos Felizes em te ajudar! 
#
#😱 Tem teste de *07* dias *Grátis*.. 
#👉 https://owenbrasil.com/#apiwhatsap"'
#


curl --location --request POST 'https://server101.owenbrasil.com/rest/sendMessage/fileUrl/?id='${id}'' \
--header 'Content-Type: application/json' \
--data-raw '{
    "receiver": "'${telefone}'", 
    "message": {
			"text":"Atenção: Uma nova instalação do MyZap foi Finalizada! Link https://wa.me/'${telefone}' \n\nAgora Acesse: '${host}':'${porta}'/start"
    }
}'


curl --location --request POST 'https://server101.owenbrasil.com/rest/sendMessage/fileUrl/?id='${id}'' \
--header 'Content-Type: application/json' \
--data-raw '{
    "receiver": "'${telefone}'", 
    "message": {
			"url":"https://owenbrasil.com/assets/img/IMG-1.png",
			"caption":"Opa !\nLançamos uma *API WhatsApp* Bem simples e funcional Estou lhe convidando a testar gratuitamente; Tem teste de *07* dias *Grátis*.. \n\nO Preço e bem em conta por *49,99*  e o funcionamento é Muito bom. \n\nAcesse o link: 👉 https://owenbrasil.com",
            "type":"image"
    }
}'

cd ~ && rm -rf myzap.sh
                                                ### FIM INSTALAÇÃO OWENBOT ###

whiptail --title "Intalador MyZap" --msgbox "OwenAPI: Ja conhece a API Premium da OwenBrasil? Nossa API estar disponivel em https://owenbrasil.com/#apiwhatsapp;" --fb 10 70
	[[ $(whoami) != 'root' ]] && {
		whiptail --title "Para continuar a instalacao, logue-se como ROOT" --msgbox "comando: su" --fb 10 70
		exit;
	}

msg1 "Agora Acesse: ${host}:${porta}/start e gere seu QrCode!";

