#! /bin/bash

# Exemplo de parsing
# Analisa estruturas de um arquivo e retorna o desejado

# Como por exemplo, analisa um arquivo html e retorna apenas todos so links da página

# -O salva o retorno em locais e com extensões específicas
wget $1 -O result.txt

# Explicações: \/

# grep href resgata apenas linhas que contem "href" do arquivo result.txt
# cut -d delimita que só irá pegar o que esta entre determinado caracter (2° parametro), o -f3 pega a 3° coluna do resultado
# grep -v inverte sua lógica padrão e não retorna linhas que contem simbolos de maior ou igual (< >)
# sort -u ordenará a lista sem repetições, pegará apenas a primeira referência que achar
grep href result.txt | cut -d "/" -f3 | grep -v "<" | grep -v ">" | grep -v "(" | sort -u > parsingResult.txt

# O resultado até aqui é uma lista com todos os links que existem naquela página específica

# Percorre todas as linhas do arquivo "parsingResult.txt"
for link in $(cat parsingResult.txt)
do
	# Com o cmd "host" pesquisa o IP de cada domínio
	# O greep filtra o retorno para apenas exibir IP's públicos
	host $link | grep "has address"
done

# Após o término da pesquisa, exclui os arquivos temporários de retorno
rm result.txt
rm parsingResult.txt

# Exemplo de retorno: (O resultado é uma lista com todos os ips e domínios citados pelo site no paramêtro)
# www.dominio.com has adress 0.0.0.0
