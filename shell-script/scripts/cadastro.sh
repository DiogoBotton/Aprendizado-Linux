#!/bin/bash

#Cadastro de usuarios em CSV para aprendizagem

arquivoPath="usuarios.csv"

#echo "Digite o nome do usuário:"
#read nome

#echo "Digite a senha do usuário:"
#read senha

if [ "$1" == "" -o "$2" == "" ]; 
then
	echo "ERROR: Paramêtros nome(1) e senha (2) não podem estar vazias"
	exit 0
fi

linha="$1,$2;"

function cabecalho(){
	echo "nome, senha"
}

function arquivo(){
	echo "$linha" 
}

if [ ! -e "$arquivoPath" ];
then
cabecalho > "$arquivoPath"
arquivo >> "$arquivoPath"
else
arquivo >> "$arquivoPath"
fi

cat "$arquivoPath"
